# Ting -> Price: £1.05
# Basket -> add items / calculate total amount in the basket

# add_item Ting
# add_item Ting
# add_item Ting
# total == £3.15

require 'rspec'
require_relative 'spec/spec_helper'
require 'bigdecimal'

class Basket
  def initialize
    @items = []
  end

  attr_reader :items

  def add_item(item)
    items << item
  end

  def total
    items.reduce(0) do |acc, item|
      acc += item.price
    end
  end
end

RSpec.describe Basket do
  subject { described_class.new }

  let(:doritos) { double('doritos', price: BigDecimal('0.60')) }
  let(:ting) { double('ting', price: BigDecimal('0.95')) }

  describe '#total' do
    it 'returns a sum of all the items in the basket' do
      subject.add_item doritos
      subject.add_item ting

      expect(subject.total).to eq 1.55
    end
  end

  describe '#add_item' do
    it 'adds items to the basket' do
      subject.add_item ting
      subject.add_item doritos

      expect(subject.items).to eq [ting, doritos]
    end
  end
end
