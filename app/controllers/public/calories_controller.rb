class Public::CaloriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_calory, only: [:show, :destroy]

  def new
    @calory = Calory.new
  end

  def create
    @calory = Calory.new(calory_params)
    @calory.user_id = current_user.id
    if @calory.save
      redirect_to calory_path(@calory.id)
    else
      flash.now[:danger] = '削除に失敗しました'
      render :new
    end
  end

  def index
    @calories = current_user.calories.page(params[:page])

  end

  def show
  end

  def destroy_all
    calories = current_user.calories
    if calories.destroy_all
      redirect_to calories_path, flash: {info: "記録を全て削除しました"}
    else
      @calories = current_user.calories.page(params[:page])
      flash.now[:danger] = '削除に失敗しました'
      render :index
    end
  end

  def destroy
    if @calory.destroy
      redirect_to calories_path, flash: {info: "記録を削除しました"}
    else
      @calories = current_user.calories.page(params[:page])
      flash.now[:danger] = '削除に失敗しました'
      render :index
    end
  end

  private

  def set_calory
    @calory = Calory.find(params[:id])
  end

  def calory_params
    params.require(:calory).permit(:mets, :weight, :minute)
  end

end
