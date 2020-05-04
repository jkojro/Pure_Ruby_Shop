require 'spec_helper'
require 'factory_bot'

require_relative '../cart'
require_relative '../product'
require_relative '../shop'

RSpec.describe 'add_product_to_cart_path', type: :feature do
  let(:product_1) { Product.new(name: "First product", price: 4.99) }
  let(:product_2) { Product.new(name: 'Second product', price: 1.99) }
  let(:product_3) { Product.new(name: 'Third product', price: 2.99) }

  it 'add, remove products and clear cart' do
    shop = Shop.new([product_1, product_3])
    expect(shop.products).to eq [product_1, product_3]

    shop << product_2
    expect(shop.products).to include product_2

    shop >> product_2
    expect(shop.products).not_to include product_2

    expect(shop.cart.products).to eq []
    shop.cart << product_1 << product_3
    expect(shop.cart.products).to include product_1
    expect(shop.cart.products).to include product_3

    shop.cart >> product_1
    expect(shop.cart.products).not_to include product_1

    shop.cart.clear
    expect(shop.cart.products).to eq []
  end
end
