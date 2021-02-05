class AddUserIdToCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :codes, :user_id, :integer
    add_index :codes, :user_id
  end
end
