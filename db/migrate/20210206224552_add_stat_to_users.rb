class AddStatToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :stat, :string
  end
end
