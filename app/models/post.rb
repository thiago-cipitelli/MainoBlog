class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  paginates_per 3
end
