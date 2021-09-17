class Follow < ApplicationRecord
  # The user giving the follow
  belongs_to :follower, foreign_key: :follower_id, class_name: "User"

  # The user being followed
  belongs_to :followed_user, foreign_key: :followed_user_id, class_name: "User"

  # validates :follower_id, uniqueness: { scope: :followed_user_id }
  # validate :cannot_follow_self
  validates :follower_id, exclusion: { in: ->(follows) { [follows.followed_user_id] }, message: "You cannot follow yourself!" }
  # private
  # def cannot_follow_self
  #   errors.add(:follower_id, 'You cannot follow yourself!') if follower_id == followed_user_id
  # end
end
