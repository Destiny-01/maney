class AddLangToCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :codes, :lang, :integer, default: 0
  end
end
