class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :venue, optional: true
  belongs_to :post, optional: true
  belongs_to :animal, optional: true
  belongs_to :commenter, polymorphic: true
    
  validates :body, presence: true
end
