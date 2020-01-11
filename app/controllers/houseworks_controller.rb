class HouseworksController < ApplicationController
  before_action :correct_user, only: [:destroy]
  before_action :require_user_logged_in

  
  def index
  end

  def new
    @housework = current_user.houseworks.build
    @current_user_houseworks = current_user.houseworks.order(id: :desc).page(params[:page])
    @partner_houseworks = partner&.houseworks&.order(id: :desc)&.page(params[:page])
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
  end

  def create
    @housework = current_user.houseworks.build(housework_params)
    if @housework.save
      flash[:success] = "家事を登録しました。"
      redirect_to new_housework_url
    else
      flash.now[:danger] = "家事の登録に失敗しました。"
      render :new
    end
  end
    
  
  def destroy
    @current_user_housework.destroy
    flash[:success] = "家事分担リストから削除しました"
    redirect_to new_housework_url
  end
  
  private
  
  def housework_params
    params.require(:housework).permit(:category, :name, :goal, :frequency)
  end
  
  def correct_user
    @current_user_housework = current_user.houseworks.find_by(id: params[:id])
    unless @current_user_housework
      redirect_to root_url
    end
  end
  
end