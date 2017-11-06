class CreateUserOweDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :user_owe_details do |t|
      t.float :owe_amount
      t.float :paid_amount
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
