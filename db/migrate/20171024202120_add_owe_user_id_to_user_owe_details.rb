class AddOweUserIdToUserOweDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :user_owe_details, :owe_user_id, :integer
  end
end
