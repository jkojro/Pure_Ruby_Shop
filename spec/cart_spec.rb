require 'spec_helper'
require_relative '../cart'
# require_relative '../product'


RSpec.describe Cart do
  # product = Product.new('Awesome product', 4.99)
  subject { described_class.new([11]) }

  it 'initialize with given products ids' do
    expect(subject.products).to eq [11]
  end

  it 'adds a product to cart' do
    subject << 21
    expect(subject.products).to include 21
  end

  it 'removes product fom cart' do
    subject >> 11
    expect(subject.products).to eq []
  end

  it 'rclears cart' do
    subject.clear
    expect(subject.products).to eq []
  end
end
