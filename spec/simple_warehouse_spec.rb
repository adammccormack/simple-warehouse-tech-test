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
    let(:output) do
      [['P', ' '],
       [' ', ' ']]
    end
    it 'stores product at given location' do
      warehouse = SimpleWarehouse.new
      warehouse.init(2,2)

      warehouse.store(1,1,1,1,'P')

      expect(warehouse.view).to match_array(output)
    end
  end

  describe '#remove' do
    let(:output) do
      [[' ', ' '],
       [' ', ' ']]
    end
    it 'removes any product at given location' do
      warehouse = SimpleWarehouse.new
      warehouse.init(2,2)
      warehouse.store(1,1,1,1,'P')

      warehouse.remove(1,1,1,1)

      expect(warehouse.view).to match_array(output)
    end
  end

  describe '#locate' do
      locate_output = "\"0: 0: P\"\n\"0: 1: P\"\n\"1: 0: P\"\n\"1: 1: P\"\n"
      
      it 'returns all index locations/values of product' do
        warehouse = SimpleWarehouse.new
        warehouse.init(3,3)
        warehouse.store(1,2,2,2,'P')


        expect { warehouse.locate('P') }.to output(locate_output).to_stdout
      end
  end
end

