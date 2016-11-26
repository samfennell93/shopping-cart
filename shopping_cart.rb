# Ting -> Price: £1.05
# Basket -> add items / calculate total amount in the basket

# add_item Ting
# add_item Ting
# add_item Ting
# total == £3.15

require_relative 'spec/spec_helper'

class Basket
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def items
    @items
  end
end

RSpec.describe Basket do
  describe '#add_item' do
    subject { described_class.new }

    let(:ting) { double('ting') }

    it 'adds items to the basket' do
      subject.add_item ting

      expect(subject.items).to eq [ting]
    end
  end
end
