class EpicenterController < ApplicationController
before_action :authenticate_user!
  def feed
  @tweets = Tweet.where(user_id: current_user.following.push(current_user.id)).order(created_at: :desc)
@users = User.all
  end

  def show_user
    @user= User.find(params[:id])
  end

  def now_following
    current_user.following.push(param[id].to_i)
    current_user.save
    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(param[id].to_i)
    current_user.save
    redirect_to show_user_path(id: params[:id])
  end

def tag_tweets
    @tag = Tag.find(params[:id])
end
def all_users
  @users = User.all
end
def following
  @user= User.find(params[:id])
  @users= []
  User.all.each do|user|
    if @user.following.include?(user.id)
      @users.push(user)
end
end
end
def followers
  @user= User.find(params[:id])
  @user= []
  User.all.each do|user|
    if @user.following.include?(user.id)
      @user.push(user)
end
end
end
end
