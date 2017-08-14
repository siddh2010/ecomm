class BankCustomer < ApplicationRecord
	validates_presence_of :name, :balance, :account_number
	validates_numericality_of :balance, greater_than_or_equal_to: 0
	validates_uniqueness_of :account_number
	def withdraw_deposit(amount, code)
		if code == 0
			#validated by the validations defined above
			self.balance = self.balance - amount
			self.update_attributes(balance: self.balance)
		else
			self.balance = self.balance + amount
			self.update_attributes(balance: self.balance)
		end
	end
end
