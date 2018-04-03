require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "product link takes them to the products show page" do
    # ACT

    # binding.pry
    visit root_path
    # puts @product.name
    click_on @product.name

    # VERIFY
    expect(page).to have_content(@product.name) && have_css('section.products-show')

    # DEBUG
    save_screenshot
  end
end

