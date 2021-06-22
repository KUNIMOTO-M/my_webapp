class Like < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  scope :filter_by_post, ->(micropost_id) { where(micropost_id: micropost_id) if micropost_id }
end
