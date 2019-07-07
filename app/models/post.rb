class Post < ApplicationRecord
  validates :caption, presence: true
  
  belongs_to :user
  
  has_many :comments
  has_many :likes
end