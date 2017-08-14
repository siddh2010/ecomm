class Item < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates_presence_of :user_id, :product_id, :quantity
	validates_numericality_of :user_id, :product_id
	validates_numericality_of :quantity, within: 1..10
	def save_update_item
		if Item.where('product_id = ? AND user_id = ?', self.product_id, self.user_id).empty?
			self.save
		else
			Item.find_by(product_id: self.product_id, user_id: self.user_id).update_attributes(quantity: self.quantity)
		end
	end
end
