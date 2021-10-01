# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
	fill_in 'Author', with: 'JK Rowling'
	fill_in 'Price', with: '10.29'
	select 2020, :from => "book[published_date(1i)]"
	select 'June',  :from=> "book[published_date(2i)]"
	select 19, :from=> "book[published_date(3i)]"
	

    click_on 'Create Book'
    visit books_path
	
    expect(page).to have_content('harry potter')
	expect(page).to have_content('JK Rowling')
	expect(page).to have_content('10.29')
	expect(page).to have_content('2020-06-19')
  end

  scenario 'does not have a valid author' do 
	visit new_book_path
    fill_in 'Title', with: 'harry potter'
	fill_in 'Price', with: '10.29'
	select 2020, :from => "book[published_date(1i)]"
	select 'June',  :from=> "book[published_date(2i)]"
	select 19, :from=> "book[published_date(3i)]"
	

    click_on 'Create Book'
    visit books_path
	
    expect(page).not_to have_content('JK Rowling')
	
  end
  
  scenario 'does not have a valid Title' do 
	visit new_book_path
    fill_in 'Author', with: 'JK Rowling'
	fill_in 'Price', with: '10.29'
	select 2020, :from => "book[published_date(1i)]"
	select 'June',  :from=> "book[published_date(2i)]"
	select 19, :from=> "book[published_date(3i)]"
	

    click_on 'Create Book'
    visit books_path
	
    expect(page).not_to have_content('harry potter')
	
  end
  
  
  scenario 'does not have a valid Price' do 
	visit new_book_path
	fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
	select 2020, :from => "book[published_date(1i)]"
	select 'June',  :from=> "book[published_date(2i)]"
	select 19, :from=> "book[published_date(3i)]"
	

    click_on 'Create Book'
    visit books_path
	
    expect(page).not_to have_content('10.29')
	
  end
  
end

