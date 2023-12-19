require_relative 'inventory'
class OrderManager
  # cart is a of hash with item's id as key and their quantity as value
  attr_accessor :cart

  def initialize
    @cart = Hash.new(0)
  end

  def start
    Inventory.print_inventory
    puts "
      --------OrderManager menu-------------
      Press 1 to add item to your cart
      Press 2 to go to generate bill
      Press 3 to exit
      ------------------------------
      "
    res = gets.chomp.to_i
    case res
    when 1
      add_item_to_cart
      start
    when 2
      generate_bill
      start
    when 3
      puts 'Exiting ....'
    else
      puts 'Invalid Input'
    end
  end

  def add_item_to_cart
    puts 'Enter the id of the item you want to order: '
    item_id = gets.chomp.to_i
    item = Inventory.get_item(item_id.to_i)
    raise StandardError.new('Item not found.') if item == nil
    puts "Enter the no of #{item.name} you want: "
    quantity = gets.chomp.to_i
    raise StandardError.new('Invalid Quantity') unless item.quantity >= quantity + cart['item_id']

    cart[item_id] += quantity
  rescue StandardError => e
    puts "Error: #{e.message}"
  end

  def generate_bill
    bill = "Bill Summary\n"
    total = 0

    puts "Cart #{@cart}"

    @cart.each do |item_id, quantity|
      line_total = 0
      item = Inventory.get_item(item_id.to_i)
      Inventory.decrease_item_stock_by(item_id, quantity)
      line_total = item.price * quantity
      bill += "Item: #{item.name}, Quantity: #{quantity}, Price: Rs.#{item.price}, Total: Rs.#{line_total}\n"
      total += line_total
    end
    bill += "Total Price: Rs.#{total}\n"

    puts bill
  end
end
