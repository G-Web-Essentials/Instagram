class Post < ApplicationRecord
  belongs_to :venue
  has_many_attached :images
end
