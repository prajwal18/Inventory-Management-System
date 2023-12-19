require_relative 'item'
require 'json'

module JsonConverter
  PATH = './lib/data.json'

  def hash_to_item(hash)
    Item.new(hash['id'], hash['name'], hash['price'], hash['quantity'])
  end

  def update_item_attributes(item, hash)
    item_hash = item.to_hash
    hash.each do |key, value|
      item_hash[key] = value
    end
    hash_to_item(item_hash)
  end

  def all_items
    raw_data = File.read(PATH)
    item_list = []
    if raw_data != ''
      item_list = JSON.parse(raw_data)
      item_list.collect! do |hash|
        hash_to_item(hash)
      end
    end
    item_list
  end

  def update_inventory(new_items)
    hash_list = new_items.collect(&:to_hash)
    json = JSON.generate(hash_list)
    File.write(PATH, json)
  end

  # Only used for testing
  def json_to_hash(json)
    JSON.parse(json)
  end

  def load_json_from_file(path)
    File.read(path)
  end
  # Only used for testing
end
