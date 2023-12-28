class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post_id, uniqueness: {scope: :user_id}

  after_save :update_favorites_count
  after_destroy :update_favorites_count
  

  private

  def update_favorites_count
    post.update_column(:favorites_count, post.favorites.count)
  end
end
