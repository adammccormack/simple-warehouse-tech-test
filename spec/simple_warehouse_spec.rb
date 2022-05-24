# frozen_string_literal: true

require 'simple_warehouse'

describe SimpleWarehouse do
  subject(:warehouse) { described_class.new }

  it { is_expected.to respond_to(:run) }
  it { is_expected.to respond_to(:init).with(2).argument }
  it { is_expected.to respond_to(:store).with(5).argument }
  it { is_expected.to respond_to(:remove).with(4).argument }
  it { is_expected.to respond_to(:locate).with(1).argument }
  it { is_expected.to respond_to(:view) }
  it { is_expected.to respond_to(:quit) }


  describe '#run' do
    it 'confirms run' do
        warehouse = double('warehouse')
        allow(warehouse).to receive(:run).and_return(true) 
        
        result = warehouse.run

        expect(result).to eq(true)
    end
  end

  describe '#init' do
    let(:output) {
      [[' ', ' '],
       [' ', ' ']]
    }
    it 'initialises a new warehouse' do
      result = warehouse.init(2,2)

      expect(result).to match_array(output)
    end
  end

  describe '#store' do
    let(:output) {
      [['P', ' '],
       [' ', ' ']]
    }
    it 'stores product at given location' do
      warehouse.init(2,2)

      warehouse.store(1,1,1,1,'P')

      expect(warehouse.view).to match_array(output)
    end
  end

  describe '#remove' do
    let(:output) {
      [[' ', ' '],
       [' ', ' ']]
    }
    it 'removes any product at given location' do
      warehouse.init(2,2)
      warehouse.store(1,1,1,1,'P')

      warehouse.remove(1,1,1,1)

      expect(warehouse.view).to match_array(output)
    end
  end

  describe '#locate' do
    locate_output = "\"0: 0: P\"\n\"0: 1: P\"\n\"1: 0: P\"\n\"1: 1: P\"\n"
    it 'returns all index locations/values of product' do
      warehouse.init(3,3)
      warehouse.store(1,2,2,2,'P')
      expect { warehouse.locate('P') }.to output(locate_output).to_stdout
    end
  end

  describe '#view' do
    let (:output) { 
      [['P', ' '],
       [' ', ' ']]
    }
    it 'returns a view of the current warehouse state' do
      warehouse.init(2,2)
      warehouse.store(1,1,1,1,'P')

      expect(warehouse.view).to match_array(output)
    end
  end
end

