require 'spec_helper'
require_relative '../product'


RSpec.describe Product do
  subject { described_class.new(name:'Awesome product', price: 4.99) }

  describe '#initialize' do
    it 'set name' do
      expect(subject.name).to eq 'Awesome product'
    end

    it 'set price' do
      expect(subject.price).to eq 4.99
    end

    it 'set id' do
      expect(subject.id).not_to be nil
    end
  end

  describe '#to_s' do
    it 'show product' do
      expect(subject.to_s).to eq "Awesome product, cena 4.99 zł"
    end
  end
end
