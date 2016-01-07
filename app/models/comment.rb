class Comment < ActiveRecord::Base
  
  has_many :recipe_comments
  belongs_to :recipe_comments
  belongs_to :chef
  
  validates :comment, presence: true, length: { maximum: 350}
  
end
