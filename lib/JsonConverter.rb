require 'json'
require 'Item'

class JsonConverter
  class << self
    def hash_to_item(hash)
      Item.new(hash["id"], hash["name"], hash["price"], hash["quantity"])
    end

    def json_to_hash(json)
      JSON.parse(json)
    end

    def load_json_from_file(path)
      File.read(path)
    end
  end
end
