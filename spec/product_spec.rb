require 'spec_helper'
require_relative '../product'
# require 'pry'


RSpec.describe Product do
  subject { described_class.new('Awesome product', 4.99) }

  describe 'initialize' do
    it 'set name' do
      expect(subject.name).to eq 'Awesome product'
    end

    it 'set price' do
      expect(subject.price).to eq 4.99
    end

    it 'set id' do
      # expect(subject.id).not_to be_present
      # expected "8e6e963845c89f205f8e" to respond to `present?`
    end
  end

  describe 'show' do
    it 'show product' do
      expect(subject.show).to eq "Awesome product, cena 4.99 zł"
    end
  end
end
