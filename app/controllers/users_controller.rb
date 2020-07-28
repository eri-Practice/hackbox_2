class UsersController < ApplicationController
  before_action :set_user, only: [:show, :like_posts, :followings]

  def show
    @posts = @user.posts
  end
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def like_posts
  end

  def followings
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
