class AddUrlToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :url, :string
  end
end
