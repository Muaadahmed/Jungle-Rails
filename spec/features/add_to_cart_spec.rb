require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "See cart increases by one when visitor clicks on Add button" do
    visit root_path

    click_on "Add"
    expect(page.find('#navbar ul:nth-child(2) li:nth-child(2)').has_content?('My Cart (1)')).to eq(true)
  end
end
