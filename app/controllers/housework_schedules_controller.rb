class HouseworkSchedulesController < ApplicationController
  def index
  end

  def new
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
    @time = Time.now
    @current_user_housework_schedule = current_user.housework_schedules.build #form_with用
    @current_user_houseworks = current_user.houseworks #form_with選択リスト用
    @current_user_scheduled_houseworks = current_user.housework_schedules.order(started_at: :asc) #登録済みスケジュール表示用
  end

  def create
    @housework_schedule = current_user.housework_schedules.build(housework_schedule_params)
    if @housework_schedule.save
      flash[:success] = "スケジュールを登録しました。"
      redirect_to new_housework_schedule_url
    else
      flash.now[:danger] ="スケジュール登録に失敗しました。"
      render :new
    end
  end
  
  private
  
  def housework_schedule_params
    params.require(:housework_schedule).permit(:housework_id, :description, :started_at, :ended_at)
  end
  
end