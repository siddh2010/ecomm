class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.string :body
      t.integer :product_id
      t.integer :user_id
    end
  end
end
