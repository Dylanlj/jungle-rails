require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    describe "all valid fields" do
      before :each do
        @category = Category.new(name: "hipster")
        @category.save
        @product = Product.new(
        name: "coffee maker",
        price: 2341.32,
        quantity: 4,
        category: @category)
      end

      it "should return a name error" do
        @product.name = nil
        @product.save
        expect(@product.errors.full_messages.any?).to be_truthy
      end
      it "should return a price error" do

        @product.price = false

        @product.save

        expect(@product.errors.full_messages.any?).to be_truthy
      end
      it "should return a quantity error" do
        @product.quantity = nil
        @product.save
        expect(@product.errors.full_messages.any?).to be_truthy
      end
      it "should return a category error" do
        @product.category = nil
        @product.save
        expect(@product.errors.full_messages.any?).to be_truthy
      end
      it "should save successfully" do
        @product.save
        expect(@product.errors.full_messages.any?).to be_falsy
      end

    end

  end
end

