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
      redirect_to admin_root_path, notice: 'ユーザーの情報を編集しました'
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    if @user.destroy
       redirect_to admin_root_path, notice: 'ユーザーを削除しました'
    else
      flash.now[:alert] = '削除に失敗しました'
      render admin_user_path(@user)
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