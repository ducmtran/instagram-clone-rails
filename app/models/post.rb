class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :caption, presence: true
end