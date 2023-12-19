require_relative 'inventory';

class Update

  def start()
    puts "---Update Inventory Menu ---
     1)EditName
     2)EditPrice
     3)DecreaseQuantity
     4)IncreaseQuantity
     5)exit
     "
     response = gets.chomp.to_i

    case response
    when 1
      editName()
     when 2
      editPrice()
     when 3
      decreaseQuantity()
     when 4
      increaseQuantity()
     when 5
       puts "Exiting.."
       return
     else
       puts "Please choose valid option"
       start()
    end

  end

    def editName
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
      start()
    end


    def editPrice
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

    def decreaseQuantity
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


    def increaseQuantity
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
