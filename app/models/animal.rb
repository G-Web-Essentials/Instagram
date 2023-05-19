class Animal < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :venue, optional: true
  has_many :comments, as: :commentable
  enum :species, { horse: 0, dog: 1, pony: 2 }
    
   def add_animal(animal, user)
      animal.user_id = user.id
   end
   def add_animal_venue(animal, venue)
       animal.venue_id = venue.id
   end
end
