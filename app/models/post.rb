class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables
  paginates_per 3
end
