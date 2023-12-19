require_relative 'item'

require_relative 'json_converter'

class Inventory < JsonConverter
  class << self
    def generate_item_id
      # analyze the json file and generate an unique id for an item.

      items = get_all_items

      new_id = items.reduce(0) { |max_id, item| max_id > item.id ? max_id : item.id }

      new_id + 1
    end

    def get_item(id)
      item = get_all_items.select { |itm| itm.id == id }.first
      item
    end

    def add_item(name, price, quantity)
      # add an item to the inventory

      id = generate_item_id

      new_item = Item.new(id, name, price, quantity)

      new_items = get_all_items

      new_items << new_item

      update_inventory(new_items)
    end

    def remove_item(id)
      # remove an item from the inventory

      items = get_all_items.reject do |item|
        item.id == id
      end

      update_inventory(items)
    end

    def has_item(id)
      is_present = get_all_items.any? { |item| item.id == id }
      if (is_present)
        return true
      else
        return false
      end
    end

    def edit_item_name(id, name)
      # edit an item's name in the inventory
      items = get_all_items.collect do |item|
         if item.id == id
          item.name = name
         end
        item
      end

      update_inventory(items)
    end

    def edit_item_price(id, price)
      # edit an item's price in the inventory
      items = get_all_items.collect do |item|
        item.price = price if item.id == id
        item
      end

      update_inventory(items)
    end

    def decrease_item_stock_by(id, quantity)
      # decrease item stock in the inventory by (quantity)
      items = get_all_items.collect do |item|
        item.quantity -= quantity if item.id == id and item.quantity != 0
        item
      end

      update_inventory(items)
    end

    def increase_item_stock_by(id, quantity)
      # increases item stock in the inventory by (quantity)

      items = get_all_items.collect do |item|
        item.quantity += quantity if item.id == id
        item
      end

      update_inventory(items)
    end

    def clear_inventory
      update_inventory([])
    end

    def print_inventory
      puts "\nInventory:"
      get_all_items.each do |item| 
        puts "Id: #{item.id}, Name: #{item.name}, Price: #{item.price}, Quantity: #{item.quantity}"
      end
      puts "\n"
    end
  end

  private_class_method :generate_item_id, :new
end