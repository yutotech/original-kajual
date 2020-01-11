class ToppagesController < ApplicationController
  
  def index
    if logged_in?
      @relationship = current_user.relationships.build
      @wd = ["日", "月", "火", "水", "木", "金", "土"]
      @time = Time.now        
      @relationship2 = proposer&.relationships&.first
      @current_user_scheduled_houseworks = current_user.housework_schedules.order(started_at: :asc) 
      @partner_scheduled_houseworks = partner&.housework_schedules&.order(started_at: :asc) 
    else
      render :layout => 'application_toppages'
      @contact = Contact.new
    end
  end
  
end