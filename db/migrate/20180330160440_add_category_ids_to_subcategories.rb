class AddCategoryIdsToSubcategories < ActiveRecord::Migration[5.1]
  def change
    add_column :subcategories, :category_id, :integer
  end
end
