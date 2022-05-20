require 'simple_warehouse'

describe SimpleWarehouse do
  
  it { is_expected.to respond_to(:init).with(2).argument }

  describe '#init' do
    let (:output) { [[1, 2 ],
                     [3, 4 ]]
   }
    it 'initialises a new warehouse' do
      warehouse = SimpleWarehouse.new
      
      result = warehouse.init(2,2)

      expect(result).to match_array(output)
    end
  end
end