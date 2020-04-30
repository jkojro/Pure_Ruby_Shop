class Cart
  attr_reader :products, :total_price

  def initialize(products=[])
    @products = products
  end

  def <<(product_id)
    @products << product_id
  end

  def >>(product_id)
    @products.delete(product_id)
  end

  def clear
    @products = []
  end
end
