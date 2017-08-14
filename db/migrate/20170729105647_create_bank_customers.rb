class CreateBankCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_customers do |t|
      t.string :name
      t.string :account_number
      t.float :balance
      t.timestamps
    end
  end
end
