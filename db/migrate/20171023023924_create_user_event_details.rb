class CreateUserEventDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :user_event_details do |t|
      t.float :paid_amount
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
