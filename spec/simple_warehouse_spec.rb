require 'simple_warehouse'

describe SimpleWarehouse do
  
  it { is_expected.to respond_to(:init).with(2).argument }

  describe '#init' do
    it 'initialises a new warehouse' do
      warehouse = SimpleWarehouse.new

      warehouse.init(10,10)

      expect(warehouse.view).to be_truthy
    end
  end
end