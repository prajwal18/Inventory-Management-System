class Item
  attr_accessor :id, :name, :price, :quantity

  def initialize(id, name, price, quantity)
    @id = id
    @name = name
    @price = price
    @quantity = quantity
  end

  def to_hash
    {
      'id' => @id,
      'name' => @name,
      'price' => @price,
      'quantity' => @quantity
    }
  end
end
