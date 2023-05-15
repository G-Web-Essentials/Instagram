class Venue < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :animals
  has_one_attached :profile_picture
    
  has_many :comments, as: :commenter, :dependent => :delete_all
end
