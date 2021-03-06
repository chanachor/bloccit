require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        v = Vote.new(value: 1)
        v.valid?
        expect(v.valid?).to eq(true) 

        v2 = Vote.new(value: -1)
        v2.valid?
        expect(v2.valid?).to eq(true)
        
        v3 = Vote.new(value: 2)
        v3.valid?
        expect(v3.valid?).to eq(false)

      end
    end
  end
end