class Chef < ActiveRecord::Base
  has_many :recipes
  before_save { self.name = name.capitalize }
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 2, maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105}, uniqueness: {case_sensitive: false}, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end