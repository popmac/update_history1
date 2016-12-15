class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

end
