class Post < ApplicationRecord
  belongs_to :venue
  has_many_attached :images
  has_many :likes, :dependent => :delete_all 
  has_many :likers, through: :likes, source: :user, :dependent => :delete_all 
    
  validates :images, presence: false, blob: { content_type: :image, size_range: 1..(5.megabytes) }
  
  has_many :comments, :dependent => :delete_all
end
