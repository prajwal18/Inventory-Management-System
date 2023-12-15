require 'Inventory'

describe Inventory do

  before(:all) do 
    Inventory.clear_inventory
    Inventory.add_item("Duck", 100, 100)
    Inventory.add_item("Chicken", 100, 100)
    Inventory.add_item("Coffee", 100, 100)
    Inventory.add_item("Bread", 100, 100)
  end

  describe '.get_item' do
    it 'should return an item' do
      item = Inventory.get_item(1)
      expect(item["id"]).to eql(1)
    end
  end

  describe '.has_item' do
    it 'should return false, when an item is not present in the inventory' do
      expect(Inventory.has_item(22)).to eql(false)
    end
  end

  describe '.remove_item' do
    it 'should remove an item from the inventory' do 
      Inventory.remove_item(1)
      expect(Inventory.has_item(1)).to eql(false)
    end
  end

  describe '.edit_item_name' do
    it 'should change the name of an item' do
      new_name = 'KungFu Coffee'
      Inventory.edit_item_name(3, new_name)
      item = Inventory.get_item(3)
      expect(item["name"]).to eql(new_name)
    end
  end

  describe '.edit_item_price' do
    it 'should change the price of an item' do
      new_price = 130
      Inventory.edit_item_price(3, new_price)
      item = Inventory.get_item(3)
      expect(item["price"]).to eql(new_price)
    end
  end

  describe '.decrease_item_stock_by' do
    it 'should decrease the stock of an item by n' do
      old_item = Inventory.get_item(3)
      old_stock = old_item["quantity"]
      Inventory.decrease_item_stock_by(3, 30)
      item = Inventory.get_item(3)
      new_stock = item["quantity"]
      expect(new_stock).to eql(old_stock - 30)
    end
  end

  describe '.increase_item_stock_by' do
    it 'should increase the stock of an item by n' do
      old_item = Inventory.get_item(3)
      old_stock = old_item["quantity"]
      Inventory.increase_item_stock_by(3, 30)
      item = Inventory.get_item(3)
      new_stock = item["quantity"]
      expect(new_stock).to eql(old_stock + 30)
    end
  end

  
  
end