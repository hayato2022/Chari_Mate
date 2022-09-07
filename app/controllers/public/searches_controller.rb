class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
      @users = User.looks(params[:search], params[:word])
      redirect_to 
  end
end
