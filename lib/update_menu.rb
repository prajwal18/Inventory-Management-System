

class Update

  def initialize(inventory)
    @inventory = inventory
  end

  def start
    puts "---Update Inventory Menu ---
     1)Update Items Name
     2)Update Items Price
     3)Update Items Quantity
     4)exit
     "
     response = gets.chomp.to_i

    case response
    when 1
      update_name
     when 2
      update_price
     when 3
      update_quantity
     when 4
       puts "Exiting.."
       return
     else
       puts "Please choose valid option"
       start
    end

  end

  def update_helper(prompt, update_method)
    puts 'Insert the name of the item you want to update'
    old_value = gets.chomp
    puts "Insert the new #{prompt} you want to assign"
     if prompt == 'name'
      new_value = gets.chomp
     else
      new_value = gets.chomp.to_i
      return puts 'Enter valid figure' if new_value == 0
     end
    @inventory.send(update_method, old_value, new_value) #send method can invoke methods of other class while passing arguments through send
  end

  def update_name
    update_helper('name', :update_info)
    start
  end


  def update_price
    update_helper('price', :update_info)
    start
  end

  def update_quantity
    puts 'Please Enter 1 to increase quantity and 2 for decrease quantity'
    res = gets.chomp.to_i
    case res
    when 0
      puts "Please enter a valid numbers as told"
      start
    when 1
      manipulate_quantity('Increase')
      start
    when 2
      manipulate_quantity('Decrease')
      start
    end
  end


  def manipulate_quantity(type)
    puts 'insert the name of item you want to update its quantity'
    name = gets.chomp
    puts "You want to #{type} quantity, how much you want to #{type} quantity"
    new_quantity = gets.chomp.to_i
    return puts 'Enter valid figure' if new_quantity == 0
    @inventory.update_quantity(name, new_quantity, type)
  end

end
