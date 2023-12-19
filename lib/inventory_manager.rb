require_relative 'inventory'
require_relative 'inventory_update_manager'

class InventoryManager
  def initialize(update)
    @update = update
  end

  # For starting Menu of InventoryManager
  def start_menu
    puts "
    -Inventory Manager Menu-
    1)View Inventory
    2)Add Items
    3)Update Inventory
    4)Delete Items
    5)Exit
    "
    res = gets.chomp.to_i

    case res
    when 1
      inventory
    when 2
      add_section
    when 3
      update_section
    when 4
      delete_section
    when 5
      puts 'Exiting..'
    else
      puts 'Please choose valid option'
      start_menu
    end
  end

  def inventory
    puts '-----------------InventoryList---------------------------'
    puts Inventory.print_inventory
    puts '----------------------------------------------------------'

    start_menu
  end

  def add_section
    puts 'Please add a name of the item you want to add'
    name = gets.chomp
    puts 'Please mention Price of item'
    price = gets.chomp.to_i
    puts 'How many quantity you want to add?'
    quantity = gets.chomp.to_i

    Inventory.add_item(name, price, quantity)
    puts 'Item is added successfully'
    start_menu
  end

  def update_section
    @update.start
    start_menu
  end

  def delete_section
    puts 'Please mention the id of the item you want to remove'
    id = gets.chomp.to_i
    unless Inventory.item?(id)
      puts 'Sorry invalid id'
      return
    end
    Inventory.remove_item(id)
    puts 'Item is removed'

    start_menu
  end
end

# mi = InventoryManager.new(Update)

# mi.start_menu;
