class RecipeComments < ActiveRecord::Migration
  def change
      create_table :recipe_comments do |t|
      t.integer :chef_id, :recipe_id, :comment_id
    end
  end
end
