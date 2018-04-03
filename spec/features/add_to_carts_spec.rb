require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'


    @product =  @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

  end

  scenario "clicking add to cart adds a product to the cart" do
    # ACT

    # binding.pry
    visit root_path
    # puts @product.name
    click_on "Add"
    puts page.html
    # VERIFY
    expect(page).to have_content("My Cart (1)")

    # DEBUG
    save_screenshot
  end
end
