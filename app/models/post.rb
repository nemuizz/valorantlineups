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
end
