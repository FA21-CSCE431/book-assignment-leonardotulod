# location: spec/feature/integration_date.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Date', with: '09/29/2001'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('09/29/2001')
  end
end