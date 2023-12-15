#require all the class here
require_relative 'ManageInventory'
require_relative 'Order'
require_relative 'Update';


class IMS
  def initialize(manageInventory, order, update)
    #Create all the instance of class here
    @manageInventory = manageInventory.new(update)
    @order = order.new


    #Initial dialogs
    puts "Enter your name?"
    @name = gets.chomp

    puts "\nWelcome to our Inventory Management System #{@name}. \nIf you want to enter in our system press 'enter' otherwise press anything except enter to exit.\n"
    response = gets.chomp

    if response == "enter" || response == ''
      start()
    else
      puts "Exiting..."
    end
  end

  # Method for Main Menu
  def start()
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
        @manageInventory.startMenu()
        start()
      when 2
        @order.start()
        start()
      when 3
        puts "Exiting ...."
      else
        puts "Invalid Input"
      end
  end
end



#Calling IMS class here
ims = IMS.new(ManageInventory, Order, Update)
