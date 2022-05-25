# frozen_string_literal: true

require 'storage'

describe Storage do
  let(:warehouse) { SimpleWarehouse.new }

  describe '#store_product_at_location' do
    let(:output) do
      [['P', ' '],
       [' ', ' ']]
    end
    it 'stores the product at given coordinates' do
      warehouse.init(2, 2)

      warehouse.store(1, 1, 1, 1, 'P')

      expect(warehouse.view).to match_array(output)
    end
  end

  describe '#remove_product_at_location' do
    let(:output) do
      [[' ', ' '],
       [' ', ' ']]
    end
    it 'stores the product at given coordinates' do
      warehouse.init(2, 2)
      warehouse.store(1, 1, 1, 1, 'P')

      warehouse.remove(1, 1, 1, 1)

      expect(warehouse.view).to match_array(output)
    end
  end
end
