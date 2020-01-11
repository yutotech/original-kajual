class UsersController < ApplicationController
  def show
    @current_user_houseworks = current_user.houseworks.order(id: :desc).page(params[:page])
    @current_user_housework_schedules = current_user.housework_schedules.order(id: :desc).page(params[:page])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザを登録しました。"
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザ登録に失敗しました。"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
