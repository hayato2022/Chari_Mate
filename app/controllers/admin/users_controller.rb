class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
   before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts
  end

  def edit
  end

  def update
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end