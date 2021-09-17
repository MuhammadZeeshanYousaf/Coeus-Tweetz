class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.followings.ids << current_user.id)
  end

  def show; end

  def follow
    follower_user_id = current_user.id
    followed_user_id = followed_user_params[:user_id].to_i
    following = Follow.find_by(follower_id: follower_user_id, followed_user_id: followed_user_id)

    if following
      following.destroy
    else
      Follow.create(follower_id: follower_user_id, followed_user_id: followed_user_id)
    end
    @followed_user = followed_user_id   # to access in follow.js.erb
  end

  def followings
    @users = current_user.followings
  end

  def followers
    @users = current_user.followers
  end

  private
  # Only allow a list of trusted parameters through.
  def followed_user_params
    params.permit(:user_id)
  end

end
