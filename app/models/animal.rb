class Animal < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :venue, optional: true
  has_many :comments, as: :commentable
  enum :species, { horse: 0, dog: 1, pony: 2 }
end
