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

      result = warehouse.init

      expect(result).to match_array(output)
    end
  end
end
