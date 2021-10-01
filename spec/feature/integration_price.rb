#Integration test for Price field:
# location: spec/feature/integration_price.rb
# rspec spec/feature/integration_price.rb

require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Price', with: '30.29'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('30.29')#ask if this needs to be in signle quotes cuz its a double
  end
end