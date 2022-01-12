require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'name should be present' do 
      @category = Category.create(name: "Peach")
      @product = Product.create(name: nil, description: "Clothes with the color peach", category_id: @category.id, quantity: 20, image: 'https://media.self.com/photos/5b75ad5728dfab53ee567688/4:3/w_2560%2Cc_limit/GettyImages-614938268.jpg', price: 2345)
      expect(@product.name).to be_nil, @product.errors.full_messages
    end

    it 'price should be present' do 
      @category = Category.create(name: "Peach")
      @product = Product.create(name: "Anny", description: "Clothes with the color peach", category_id: @category.id, quantity: 20, image: 'https://media.self.com/photos/5b75ad5728dfab53ee567688/4:3/w_2560%2Cc_limit/GettyImages-614938268.jpg', price: nil)
      expect(@product.price).to eq(0), @product.errors.full_messages
    end

    it 'Quantity should be present' do 
      @category = Category.create(name: "Peach")
      @product = Product.create(name: "Anny", description: "Clothes with the color peach", category_id: @category.id, quantity: nil, image: 'https://media.self.com/photos/5b75ad5728dfab53ee567688/4:3/w_2560%2Cc_limit/GettyImages-614938268.jpg', price: 2345)
      expect(@product.quantity).to be_nil, @product.errors.full_messages
    end

    it 'Category should be present' do 
      @category = Category.create(name: "Peach")
      @product = Product.create(name: "Anny", description: "Clothes with the color peach", category_id: nil, quantity: 20, image: 'https://media.self.com/photos/5b75ad5728dfab53ee567688/4:3/w_2560%2Cc_limit/GettyImages-614938268.jpg', price: 2345)
      expect(@product.category_id).to be_nil, @product.errors.full_messages
    end
  end
end
