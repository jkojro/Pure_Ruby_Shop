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

  def cart_total_price
    products.inject(0) { |sum, product| sum + product.price }
  end
end
