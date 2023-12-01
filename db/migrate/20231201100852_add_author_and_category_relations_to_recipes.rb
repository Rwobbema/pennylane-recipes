class AddAuthorAndCategoryRelationsToRecipes < ActiveRecord::Migration[7.0]
  def change
    change_table :recipes do |t|
      t.belongs_to :author, index: true
      t.belongs_to :category, index: true
    end
  end
end
