class Venue < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, :dependent => :delete_all 
  has_many :animals
  has_one_attached :profile_picture
    
  has_many :comments, as: :commenter, :dependent => :delete_all 
    
  has_many :accepted_sent_requests, -> {where(accepted: true)}, class_name: "Follow", foreign_key: "follower_id", :dependent => :delete_all 

  #has_many :sent_requests, class_name: "Follow", foreign_key: "follower_id"
    

  has_many :waiting_sent_requests, -> {where(accepted: false)}, class_name: "Follow", foreign_key: "follower_id", :dependent => :delete_all 
    
  has_many :followings, through: :accepted_sent_requests, source: :followed, :dependent => :delete_all 
    
  has_many :waiting_followings, through: :waiting_sent_requests, source: :followed, :dependent => :delete_all 

  def add_animal(animal, venue)
      animal.venue_id = venue.id
  end
    
  def follow(user)
     Follow.create(follower: self, followed: user) 
  end
    
  def unfollow(user)
     self.accepted_sent_requests.find_by(followed: user)&.destroy 
  end
    
  def cancel_request(user)
      self.waiting_sent_requests.find_by(followed: user)&.destroy
  end
end
