class Post < ApplicationRecord
  has_one :users
  validates :caption, presence: true
end