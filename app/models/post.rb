class Post < ApplicationRecord
  belongs_to :venue
  has_many_attached :images
    
  validates :images, presence: false, blob: { content_type: :image, size_range: 1..(5.megabytes) }
end
