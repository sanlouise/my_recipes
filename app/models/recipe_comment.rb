class RecipeComment < ActiveRecord::Base
  
  belongs_to :comment
  belongs_to :recipe
  belongs_to :chef

end

