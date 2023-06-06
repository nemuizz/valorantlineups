class Map < ApplicationRecord
    has_many :posts

    validates :map_name, presence: true
    validates :map_name, uniqueness: true
end
