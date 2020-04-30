require 'spec_helper'
require_relative '../shop'
# require_relative '../cart'
require_relative '../product'


RSpec.describe Shop do
  product = Product.new('Awesome product', 4.99)
  subject { described_class.new([product]) }

  describe 'initialize' do
    it 'initialize with given products' do
      expect(subject.products).to eq [product]
    end
  end

  describe 'add_product' do
    it 'adds a product to shop' do
      product_2 = Product.new('Product 2', 1.99)
      subject << product_2
      expect(subject.products).to include product_2
    end

    it 'removes product fom shop' do
      subject >> product
      expect(subject.products).to eq []
    end
  end

  describe 'show product' do
    it 'shows product by id' do
      expect(subject.show_product_by_id(product.id)).to eq "Awesome product, cena 4.99 zł"
    end

    it 'show product by object' do
      expect(subject.show_product(product)).to eq "Awesome product, cena 4.99 zł"
    end
  end

  describe 'cart operations' do
    before do
      subject.add_to_cart(product)
    end

    it 'add products to cart' do
      expect(subject.cart_products).to include product
    end

    it 'removes product from cart' do
      subject.remove_from_cart(product)
      expect(subject.cart_products).to eq []
    end

    it 'clears cart' do
      subject.clear_cart
      expect(subject.cart_products).to eq []
    end

    it 'counts cart total price' do
      product_2 = Product.new('Product 2', 1.99)
      subject << product_2
      subject.add_to_cart(product_2)
      expect(subject.cart_total_price).to eq 6.98
    end
  end
end
