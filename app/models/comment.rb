class Comment < ApplicationRecord
 
  belongs_to :commenter, polymorphic: true
  belongs_to :commentable, polymorphic: true
    
  validates :body, presence: true
end
