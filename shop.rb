require_relative 'cart'

class Shop
  attr_reader :products, :cart

  def initialize(products=[])
    @products = products
    @cart = Cart.new
  end

  def <<(product)
    @products << product
  end

  def >>(product)
    @products.delete(product)
  end

  def show_product(product)
    product.to_s
  end

  def show_product_by_id(id)
    @products.find { |product| product.id == id }.to_s
  end

  def add_to_cart(product)
    @cart << product
  end

  def remove_from_cart(product)
    @cart >> product
  end

  def clear_cart
    @cart.clear
  end
end
