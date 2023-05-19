class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :animals
  has_many :likes
  has_one_attached :profile_picture
    
  has_many :comments, as: :commenter
    
  has_many :follow_requests, -> {where(accepted: false)}, class_name: "Follow", foreign_key: "followed_id"
    
  has_many :accepted_recieved_requests, -> {where(accepted: true)}, class_name: "Follow", foreign_key: "followed_id"
    
  #has_many :recieved_requests, class_name: "Follow", foreign_key: "followed_id"
  
  has_many :followers, through: :accepted_recieved_requests, source: :follower
    


  
end
