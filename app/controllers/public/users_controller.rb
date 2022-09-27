class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :sent_user, only: [:show, :edit, :update, :likes]

  def show
    @posts = @user.posts.page(params[:page]).per(9)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def likes
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @posts = Post.find(likes)
  end

  def unsubscribe
    @user = current_user
  end

  def withdrawal
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.all
    end
  end

  private

  def sent_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

end
