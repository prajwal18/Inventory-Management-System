require_relative 'Item'
require 'json'

class JsonConverter
  @@path = './lib/data.json'
  class << self
    def hash_to_item(hash)
      Item.new(hash['id'], hash['name'], hash['price'], hash['quantity'])
    end

    def get_all_items
      raw_data = File.read(@@path)
      hash_list = []
      if raw_data != ''
        hash_list = JSON.parse(raw_data)
        hash_list.collect do |hash|
          hash_to_item(hash)
        end
      end
      hash_list
    end

    def update_inventory(new_items)
      hash_list = new_items.collect do |item|
        item.to_hash
      end
      json = JSON.generate(hash_list)
      File.write(@@path, json)
    end

    # Only used for testing
    def json_to_hash(json)
      JSON.parse(json)
    end

    def load_json_from_file
      File.read(@@path)
    end
    # Only used for testing
  end
end
