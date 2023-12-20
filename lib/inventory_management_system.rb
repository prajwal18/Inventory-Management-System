# require all the class here
require_relative 'manage_inventory'
require_relative 'order'
require_relative 'menu_updater'
require_relative 'inventory'


class InventoryManagementSystem
  def initialize(manage_inventory, order)
    # Create all the instance of class here
    @manage_inventory = manage_inventory
    @order = order

    # Initial dialogs
    puts 'Enter your name?'
    @name = gets.chomp

    puts "\nWelcome to our Inventory Management System #{@name}. \nIf you want to enter in our system press 'enter' otherwise press anything except enter to exit.\n"
    response = gets.chomp

    if ['enter', ''].include?(response)
      start
    else
      puts 'Exiting...'
    end
  end

  # Method for Main Menu
  def start
    puts '
      --------Main menu-------------
      Press 1 to manage inventory
      Press 2 to order
      Press 3 to exit
      ------------------------------
      '
      res = gets.chomp.to_i
      case res
      when 1
        @manage_inventory.start_menu
        start
      when 2
        @order.start
        start
      when 3
        puts 'Exiting ....'
      else
        puts 'Invalid Input'
      end
  end
end

# Calling IMS class here
# inventory instance
inventory = Inventory.new
# update instance
update = Update.new(inventory)
# manage_inventory instance
manage_inventory = ManageInventory.new(update, inventory)
# order instance
order = Order.new(inventory)
# Main Inventory Management System instance
ims = InventoryManagementSystem.new(manage_inventory, order)
