require_relative 'inventory';
require_relative 'inventory_update_manager';

class ManageInventory
  def initialize(update)
    @update = update.new
  end

  # For starting Menu of ManageInventory
  def startMenu()
    puts "
    -ManageInventoryMenu-
    1)View Inventory
    2)Add Items
    3)Update Inventory
    4)Delete Items
    5)Exit
    "
    res = gets.chomp.to_i

    case res
    when 1
      inventory()
    when 2
      addSection()
    when 3
      updateSection()
    when 4
      deleteSection()
    when 5
      puts "Exiting.."
    else
      puts "Please choose valid option"
      startMenu()
    end
  end


  def inventory()
    inventory = Inventory.get_all_items.collect! {|item| item.to_hash};
    puts "-----------------InventoryList---------------------------"
    puts inventory;
    puts "----------------------------------------------------------"

    startMenu()
  end

  def addSection()
    puts "Please add a name of the item you want to add"
    name = gets.chomp
    puts "Please mention Price of item"
    price = gets.chomp.to_i
    puts "How many quantity you want to add?"
    quantity = gets.chomp.to_i

    Inventory.add_item(name, price, quantity);
    puts "Item is added successfully"
    startMenu()
  end

  def updateSection()
    @update.start()
    startMenu();
  end

  def deleteSection()
    puts "Please mention the id of the item you want to remove"
    id = gets.chomp.to_i
    if !Inventory.has_item(id)
      puts "Sorry invalid id"
      return
    end
    Inventory.remove_item(id)
    puts "Item is removed"

    startMenu()
  end
end


# mi = ManageInventory.new(Update)

# mi.startMenu();
