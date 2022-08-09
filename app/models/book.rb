class Book < ApplicationRecord

	validates :title, :content, :price, presence:true
end
