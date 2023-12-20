
class Inventory
  attr_reader :info

  def initialize
    @hash = {}
    @info = []
  end

  def add_info(name, price, quantity)
    return puts 'sorry the iteam you want to add is already in inventory' if @hash.key?(name)

    @hash[name] = { 'name' => name, 'price' => price, 'quantity' => quantity }
    @info.push(@hash[name])
  end

  def update_info(name, new_info)
    if @hash.key?(name)
      return @hash[name]['price'] = new_info if new_info.instance_of? Integer

      @hash[name]['name'] = new_info
      @hash[new_info] = @hash.delete(name) #For repalcing old hash keys into new updated name hash keys
    else
      puts 'Error: Please enter valid informations'
    end
  end

  def update_quantity(name, new_quantity, type)
    case type
    when 'Increase'
      increase_quantity(name, new_quantity)

    when 'Decrease'
      decrease_quantity(name, new_quantity)
    end
  end

  def increase_quantity(name, amount)
    @hash[name]['quantity'] += amount
  end

  def decrease_quantity(name, amount)
    return 'Quantity of items is less than quantity you want to decrease' if @hash[name]['quantity'] < amount

    @hash[name]['quantity'] -= amount if (@hash[name]['quantity']).positive
  end

  def get_item(name)
    @hash[name] if @hash.key?(name)
  end
end
