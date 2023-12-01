class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cook_time
      t.integer :prep_time
      t.numeric :ratings, precision: 3, scale: 2
      t.string :image_url
      t.timestamps
    end
  end
end
