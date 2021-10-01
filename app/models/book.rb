class Book < ApplicationRecord
    validates :title, presence: true
	validates :author, presence: true
	validates :price, presence: true
	validates :price, numericality: {only_float: true}
	validates :published_date, presence: true
	
	#just comment out published date and price for screenshot 4
	#comment 
end

