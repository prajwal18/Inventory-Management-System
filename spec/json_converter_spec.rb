require 'json_converter'
require 'item'

describe JsonConverter do
  before(:all) do
    @json_converter = Object.new
    @json_converter.extend(JsonConverter)
  end

  describe '.hash_to_item' do
    it 'should return a new item' do
      hash = { 'id' => 1, 'name' => 'Chicken', 'price' => 19, 'quantity' => 200 }

      item = @json_converter.hash_to_item(hash)

      expect(item.name).to eql('Chicken')
    end
  end

  describe '.json_to_hash' do
    it 'should return a new hash' do
      json = '{"id":1, "name":"Chicken", "price":100, "quantity":200}'

      hash = @json_converter.json_to_hash(json)
      expect(hash['name']).to eql('Chicken')
    end
  end

  describe '.load_json_from_file' do
    before(:all) do
      @data = @json_converter.load_json_from_file('./spec/test.json')
    end

    it 'should read and convert data from a file to hash' do
      hash = @json_converter.json_to_hash(@data)

      expect(hash['name']).to eql('Chicken')
    end

    it 'should read and convert data from a file to Item instance' do
      hash = @json_converter.json_to_hash(@data)
      item = @json_converter.hash_to_item(hash)
      expect(item.name).to eql('Chicken')
    end
  end

  describe '.hash_to_item' do
    it 'should return an item when provided with a hash' do
      data = @json_converter.load_json_from_file('./spec/test.json')
      hash = @json_converter.json_to_hash(data)
      item = @json_converter.hash_to_item(hash)
      expect(item.name).to eql('Chicken')
    end
  end
end
