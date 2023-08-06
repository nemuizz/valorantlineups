class Post < ApplicationRecord
    belongs_to :user 
    belongs_to :agent
    belongs_to :map   
    has_many :favorites, dependent: :destroy

    validates :user_id, presence: true
    validates :agent_id, presence: true
    validates :map_id, presence: true
    validates :title, presence: true
    validates :title, length: {maximum: 30}
    validates :content, length: {maximum: 500 }

    has_one_attached :position
    has_one_attached :angle
    has_one_attached :hit

    def self.ransackable_attributes(auth_object = nil)
        ["agent_id", "content", "created_at", "id", "map_id", "title", "updated_at", "user_id", "favorites_count"]
        
    end

    def map_name
      map = Map.find_by(id: self.map_id)
      return map.map_name

    end

    def agent_name
      agent = Agent.find_by(id: self.agent_id)
      return agent.agent_name
    end

   # def favorited_by?(user)
   #   Favorite.where(user_id: user.id).exists?
   # end

   
end
