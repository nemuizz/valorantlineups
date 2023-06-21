class Post < ApplicationRecord
    belongs_to :user 
    has_one :agent
    has_one :map   

    #validates :user_id, presence: true
    #validates :agent_id, presence: true
    #validates :map_id, presence: true
    #validates :title, presence: true
    #validates :content, length: {maximum: 500 }

    has_one_attached :position_image
    has_one_attached :angle_image
    has_one_attached :hit_image

    def self.ransackable_attributes(auth_object = nil)
        ["agent_id", "content", "created_at", "id", "map_id", "title", "updated_at", "user_id"]
        
    end

    def map_name
      map = Map.find_by(id: self.map_id)
      return map.map_name

    end

    def agent_name
      agent = Agent.find_by(id: self.agent_id)
      return agent.agent_name
    end

end
