# require_relative 'cart'

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
    product.show
  end

  def show_product_by_id(id)
    @products.find { |product| product.id == id }.show
  end

  def add_to_cart(product)
    @cart << product.id
  end

  def remove_from_cart(product)
    @cart >> product.id
  end

  def clear_cart
    @cart.clear
  end

  def show_products_in_cart
    @cart.products.map { |product_id| show_product_by_id(product_id) }
  end

  def cart_products
    @products.select { |product| @cart.products.include?(product.id) }
  end

  def cart_total_price
    cart_products.inject(0) { |sum, product| sum + product.price }
  end
end
