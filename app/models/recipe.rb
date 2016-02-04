class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :recipe_styles, dependent: :destroy
  has_many :styles, through: :recipe_styles
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  validates :chef_id, presence: true
  validates :name, presence: true, length: {minimum: 5, maximum: 50}
  validates :summary, presence: true, length: {minimum: 3, maximum: 350}
  validates :description, presence: true, length: {minimum: 20, maximum: 500}
  mount_uploader :picture, PictureUploader
  validate :picture
  
  default_scope -> { order(updated_at: :desc) }
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "Should be less than 5MB")
      end
    end
end