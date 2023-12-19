require_relative 'inventory';

class InventoryUpdateManager

  def start
    puts "---Update Inventory Menu ---
     1)Edit Name
     2)Edit Price
     3)Decrease Quantity
     4)Increase Quantity
     5)exit
     "
     response = gets.chomp.to_i

    case response
    when 1
      edit_name
     when 2
      edit_price
     when 3
      decrease_quantity
     when 4
      increase_quantity
     when 5
       puts "Exiting.."
       return
     else
       puts "Please choose valid option"
       start
    end

  end

    def edit_name
      puts "Please enter the id of the item you want to edit"
      id = gets.chomp.to_i
      if !Inventory.has_item(id)
        puts "Sorry invalid id"
        return
      end
      puts "Please enter the new item name"
      new_name = gets.chomp

      Inventory.edit_item_name(id, new_name)
      puts "Item name is updated"
      start
    end


    def edit_price
      puts "Please enter the id of the item you want to edit"
      id = gets.chomp.to_i
      if !Inventory.has_item(id)
        puts "Sorry invalid id"
        return
      end
      puts "Please enter the new item price"
      new_price = gets.chomp
      Inventory.edit_item_price(id, new_price)
      puts "Item Price is updated"
    end

    def decrease_quantity
      puts "Please enter the id of the item you want to edit"
      id = gets.chomp.to_i
      if !Inventory.has_item(id)
        puts "Sorry invalid id"
        return
      end
      puts "How many quantity you want to decrease"
      decrease_number = gets.chomp.to_i
      Inventory.decrease_item_stock_by(id, decrease_number)
      puts "Item quantity is decreased"
    end


    def increase_quantity
      puts "Please enter the id of the item you want to edit"
      id = gets.chomp.to_i
      if !Inventory.has_item(id)
        puts "Sorry invalid id"
        return
      end
      puts "How many quantity you want to increase"
      increase_number = gets.chomp.to_i
      Inventory.increase_item_stock_by(id, increase_number)
      puts "Item quantity increased"
    end

end
