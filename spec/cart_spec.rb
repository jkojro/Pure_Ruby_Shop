require 'spec_helper'
require 'factory_bot'
require_relative '../cart'
require_relative '../product'


RSpec.describe Cart do
  let(:p1) { Product.new(name: "First product", price: 4.99) }
  let(:p2) { Product.new(name: 'Second product', price: 1.99) }
  subject(:cart) { described_class.new([p1]) }

  it 'initialize with given products ids' do
    expect(cart.products).to eq [p1]
  end

  describe '#<<' do
    it 'adds produvt to cart' do
      expect{cart << p2}.to change{subject.products}.from([p1]).to([p1, p2])
    end
  end

  describe '#>>' do
    it 'removes product from cart' do
      expect{cart >> p1}.to change{subject.products}.from([p1]).to([])
    end
  end

  describe '#clear' do
    it 'clears cart' do
      expect{cart.clear}.to change{subject.products}.from([p1]).to([])
    end
  end

  describe  '#cart_total_pricec' do
    subject(:cart_with_many_products) { described_class.new([p1, p2]) }

    it 'counts cart total price' do
      expect(cart_with_many_products.cart_total_price).to eq 6.98
    end
  end
end
