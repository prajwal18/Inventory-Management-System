require 'Item'

class Inventory
  @@items = []

  class << self
    def generate_item_id
      # analyze the json file and generate an unique id for an item.
      new_id = @@items.reduce(0) { |max_id, id| max_id > id ? max_id: id  }
      new_id + 1
    end

    def add_item(name, price, quantity)
      # add an item to the inventory
      id = generate_item_id()
      new_item = Item.new(id, name, price, quantity)
      @@items << new_item
    end

    def remove_item(id)
      # remove an item from the inventory
    end

    def edit_item_name(id, name)
      # edit an item's name in the inventory
    end

    def edit_item_price(id, price)
      # edit an item's price in the inventory
    end

    def decrease_item_stock_by(id, quantity)
      # decrease item stock in the inventory by (quantity)
    end

    def increase_item_stock_by(id, quantity)
      # increases item stock in the inventory by (quantity)
    end

    def get_all_items
      @@items
    end
  end

  private_class_method :generate_item_id, :new
end
