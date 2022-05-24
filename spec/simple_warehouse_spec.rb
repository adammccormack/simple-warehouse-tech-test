# frozen_string_literal: true

require 'simple_warehouse'

describe SimpleWarehouse do
  it { is_expected.to respond_to(:init) }

  describe '#init' do
    let(:output) do
      [[' ', ' '],
       [' ', ' ']]
    end
    it 'initialises a new warehouse' do
      warehouse = SimpleWarehouse.new

      result = warehouse.init(2,2)

      expect(result).to match_array(output)
    end
  end

  describe '#store' do
    it 'stores product at given location' do

    end
  end

end