class Follow < ApplicationRecord
    belongs_to :follower, class_name: "Venue", foreign_key: "follower_id"
    belongs_to :followed, class_name: "User", foreign_key: "followed_id"
    
    def accept
       self.update(accepted: true) 
    end
    
    
end
