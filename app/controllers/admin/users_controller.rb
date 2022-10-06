class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @posts = @user.posts.page(params[:page]).per(9)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_root_path, flash: {info: "ユーザーの情報をしました"}
    else
      flash.now[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :profile_image, :is_active)
    end
end