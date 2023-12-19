require 'json_converter'
require 'item'

describe JsonConverter do
  describe '.hash_to_item' do
    it 'should return a new item' do
      hash = { 'id' => 1, 'name' => 'Chicken', 'price' => 19, 'quantity' => 200 }

      item = JsonConverter.hash_to_item(hash)

      expect(item.name).to eql('Chicken')
    end
  end

  describe '.json_to_hash' do
    it 'should return a new hash' do
      json = '{"id":1, "name":"Chicken", "price":100, "quantity":200}'

      hash = JsonConverter.json_to_hash(json)
      expect(hash['name']).to eql('Chicken')
    end
  end

  describe '.load_json_from_file' do
    before(:all) do
      @data = JsonConverter.load_json_from_file('./spec/test.json')
    end

    it 'should read and convert data from a file to hash' do
      hash = JsonConverter.json_to_hash(@data)

      expect(hash['name']).to eql('Chicken')
    end

    it 'should read and convert data from a file to Item instance' do
      hash = JsonConverter.json_to_hash(@data)
      item = JsonConverter.hash_to_item(hash)
      expect(item.name).to eql('Chicken')
    end
  end

  describe '.hash_to_item' do
    it 'should return an item when provided with a hash' do
      data = JsonConverter.load_json_from_file('./spec/test.json')
      hash = JsonConverter.json_to_hash(data)
      item = JsonConverter.hash_to_item(hash)
      expect(item.name).to eql('Chicken')
    end
  end
end
