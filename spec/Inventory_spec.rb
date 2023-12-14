require 'Inventory'

describe Inventory do

  describe 'Add items' do
    it 'should add item to the inventory' do
      Inventory.add_item("Chicken", 12, 100)
      expect(Inventory.get_all_items.length).to eql(1)
    end
  end
  
end