class Review < ApplicationRecord
	validates_presence_of :body, :user_id, :product_id, :rating
	validates_numericality_of :rating
	belongs_to :user
	belongs_to :product
end
