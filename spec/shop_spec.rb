require 'spec_helper'
require_relative '../shop'
require_relative '../cart'
require_relative '../product'


RSpec.describe Shop do
  let(:product_1) { Product.new(name:'Awesome product', price:4.99) }
  let(:product_2) { Product.new(name:'Second product', price:1.99) }

  subject(:shop) { described_class.new([product_1]) }

  describe 'initialize' do
    it 'initialize with given products' do
      expect(shop.products).to eq [product_1]
    end
  end

  describe '#<<' do
    it 'adds a product to shop' do
      expect{shop << product_2}.to change{shop.products}.from([product_1]).to([product_1, product_2])
    end
  end

  describe '#>>' do
    it 'removes product fom shop' do
      expect{shop >> product_1}.to change{shop.products}.from([product_1]).to([])
    end
  end

  describe 'show _product' do
    it 'shows product by id' do
      expect(subject.show_product_by_id(product_1.id)).to eq "Awesome product, cena 4.99 zł"
    end

    it 'show product by object' do
      expect(subject.show_product(product_1)).to eq "Awesome product, cena 4.99 zł"
    end
  end

  describe 'cart operations' do
    describe '#add_to_cart' do
      it 'add products to cart' do
        expect{subject.add_to_cart(product_2)}.to change{subject.cart.products}.from([]).to([product_2])
      end
    end

    describe '#remove_from_cart' do
      before { subject.add_to_cart(product_1) }
      it 'removes product from cart' do
        expect{subject.remove_from_cart(product_1)}.to change{subject.cart.products}.from([product_1]).to([])
      end
    end

    describe '#clear-cart' do
      before { subject.add_to_cart(product_1) }
      it 'clears cart' do
        expect{subject.clear_cart}.to change{subject.cart.products}.from([product_1]).to([])
      end
    end
  end
end
