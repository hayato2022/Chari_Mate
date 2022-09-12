class Public::CaloriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @calory = Calory.new
  end

  def create
    @calory = Calory.new(calory_params)
    @calory.user_id = current_user.id
    @calory.save
    redirect_to calory_path(@calory.id)
  end

  def index
    @calories = current_user.calories.all
  end

  def show
    @calory = Calory.find(params[:id])
  end

  private

  def calory_params
    params.require(:calory).permit(:mets, :weight, :minute)
  end

end
