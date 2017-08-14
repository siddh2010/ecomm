class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.timestamps
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
    end
  end
end
