# frozen_string_literal: true

# ManageInventory is class used for Adding, viewing and updating Inventory
class ManageInventory
  def initialize(update, inventory)
    @update = update
    @inventory = inventory
  end

  # For starting Menu of ManageInventory
  def start_menu
    puts "
    -ManageInventoryMenu-
    1)View Inventory
    2)Add Items
    3)Update Inventory
    4)Get Specific Items
    5)Exit
    "
    res = gets.chomp.to_i

    case res
    when 1
      inventory
    when 2
      add_items
    when 3
      update_section
    when 4
      specific_item_details
    when 5
      puts 'Exiting..'
    else
      puts 'Please choose valid option'
      start_menu
    end
  end

  def inventory
    puts '-----------------InventoryList---------------------------'
    puts @inventory.info
    puts '----------------------------------------------------------'

    start_menu
  end

  def add_items
    puts 'Please mention the item name you want to add'
    name = gets.chomp

    puts 'Please mention price of that item too'
    price = gets.chomp.to_i

    puts 'How many quantity you want'
    quantity = gets.chomp.to_i

    if quantity.zero? || price.zero?
      puts 'Please enter valid number for quantity and price'
      start_menu
    end

    @inventory.add_info(name, price, quantity)

    start_menu
  end

  def update_section
    @update.start
    start_menu
  end

  def specific_item_details
    puts 'Enter the specific name of the item you want to check details : '
    name = gets.chomp
    puts @inventory.get_item(name)
  end
end
