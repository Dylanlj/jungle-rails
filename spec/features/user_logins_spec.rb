require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do
    User.create!({
      first_name: "rar",
      last_name: "rar",
      email: "rar@rar.com",
      password: "raririum",
      password_confirmation: "raririum"
      })
  end

  scenario "user can login" do
    visit login_path

    fill_in 'email', with: 'rar@rar.com'
    fill_in 'password', with: 'raririum'
    click_on 'Submit'
    expect(page).to have_content("Logout")

  end
end
