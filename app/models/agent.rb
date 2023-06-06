class Agent < ApplicationRecord
    has_many :posts

    validates :agent_name, presence: true
    validates :agent_name, uniqueness: true
end
