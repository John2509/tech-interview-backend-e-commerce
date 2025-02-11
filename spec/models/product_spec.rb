require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'with relationships' do
    it "should have many cart_items" do
      t = Product.reflect_on_association(:cart_items)
      expect(t.macro).to eq(:has_many)
    end
  end

  context 'when validating' do
    it 'validates presence of name' do
      product = described_class.new(price: 100)
      expect(product.valid?).to be_falsey
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of price' do
      product = described_class.new(name: 'name')
      expect(product.valid?).to be_falsey
      expect(product.errors[:price]).to include("can't be blank")
    end

    it 'validates numericality of price' do
      product = described_class.new(price: -1)
      expect(product.valid?).to be_falsey
      expect(product.errors[:price]).to include("must be greater than or equal to 0")
    end
  end
end
