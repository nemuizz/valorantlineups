class Post < ApplicationRecord
    belongs_to :user    

    validates :user_id, presence: true
    validates :agent_id, presence: true
    validates :map_id, presence: true
    validates :title, presence: true
    validates :content, length: {maximum: 500 }
end
