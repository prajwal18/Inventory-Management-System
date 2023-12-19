require_relative 'item'

require_relative 'json_converter'

class Inventory
  class << self
    include JsonConverter
    def generate_item_id
      # analyze the json file and generate an unique id for an item.

      items = all_items

      new_id = items.reduce(0) { |max_id, item| max_id > item.id ? max_id : item.id }

      new_id + 1
    end

    def get_item(id)
      all_items.select { |itm| itm.id == id }.first
    end

    def add_item(name, price, quantity)
      # add an item to the inventory

      id = generate_item_id

      new_item = Item.new(id, name, price, quantity)

      new_items = all_items

      new_items << new_item

      update_inventory(new_items)
    end

    def remove_item(id)
      # remove an item from the inventory

      items = all_items.reject do |item|
        item.id == id
      end

      update_inventory(items)
    end

    def item?(id)
      is_present = all_items.any? { |item| item.id == id }
      return true if is_present

      false
    end

    def modify_item(id, hash)
      items = all_items.collect do |item|
        item.id == id ? update_item_attributes(item, hash) : item
      end

      update_inventory(items)
    end

    def decrease_item_stock_by(id, quantity)
      # decrease item stock in the inventory by (quantity)
      hash = { 'quantity' => 0 }

      all_items.collect do |item|
        if item.id == id && item.quantity >= quantity
          hash['quantity'] = item.quantity - quantity
        elsif item.id == id
          raise StandardError, "Required quantity: #{quantity}, Available stock: #{item.quantity}"
        end
      end

      modify_item(id, hash)
    end

    def increase_item_stock_by(id, quantity)
      # increases item stock in the inventory by (quantity)
      hash = { 'quantity' => 0 }

      all_items.collect do |item|
        item.id == id &&
          hash['quantity'] = item.quantity + quantity
      end

      modify_item(id, hash)
    end

    def clear_inventory
      update_inventory([])
    end

    def print_inventory
      puts "\nInventory:"
      all_items.each do |item|
        puts "Id: #{item.id}, Name: #{item.name}, Price: #{item.price}, Quantity: #{item.quantity}"
      end
      puts "\n"
    end
  end

  private_class_method :generate_item_id, :new
end
