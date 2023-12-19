# require all the class here
require_relative 'inventory_manager'
require_relative 'order_manager'
require_relative 'inventory_update_manager'

class IMS
  def initialize(inventory_manager, order_manager)
    # Create all the instance of class here
    @inventory_manager = inventory_manager
    @order_manager = order_manager

    # Initial dialogs
    puts 'Enter your name?'
    @name = gets.chomp

    puts "\nWelcome to our Inventory Management System #{@name}."
    puts "If you want to enter in our system press 'enter' otherwise press anything except enter to exit.\n"

    response = gets.chomp

    if ['enter', ''].include?(response)
      start
    else
      puts 'Exiting...'
    end
  end

  # Method for Main Menu
  def start
    puts "
      --------Main menu-------------
      Press 1 to manage inventory
      Press 2 to order
      Press 3 to exit
      ------------------------------
      "
    res = gets.chomp.to_i
    case res
    when 1
      @inventory_manager.start_menu
      start
    when 2
      @order_manager.start
      start
    when 3
      puts 'Exiting ....'
    else
      puts 'Invalid Input'
    end
  end
end

# Calling IMS class here

inventory_manager = InventoryManager.new(InventoryUpdateManager.new)
order_manager = OrderManager.new
ims = IMS.new(inventory_manager, order_manager)
