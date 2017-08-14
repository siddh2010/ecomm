class Product < ApplicationRecord
	belongs_to :category
	has_many :items
	has_many :reviews
	validates_presence_of :name, :price, :category_id, :description
	validates_numericality_of :price, :category_id, greater_than: 0
	def display
	    "#{self.name} ||| Price: #{self.price}  ||| Category: #{Category.all.find {|category| category.id == self.category_id}.name}"
	end
end
