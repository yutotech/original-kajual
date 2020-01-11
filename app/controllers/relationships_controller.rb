class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    if user=User.find_by(name: params[:name])
      secret_words=params[:relationship][:secret_words]
      status=params[:status]
      current_user.offer(user, secret_words, status)
      flash[:success] = "パートナー申請をしました。"
      redirect_to root_url
    else
      flash.now[:danger] = "該当ユーザがいませんでした。"
      render "toppages/index"
    end
  end
  
  def update
      secret_words = params[:relationship][:secret_words]
    if received? && confirmation(secret_words)
      user=current_user
      secret_words=params[:relationship][:secret_words]
      status=params[:status]
      proposer.offer(user, secret_words, status)        
      flash[:success] = "パートナー承認しました"
      redirect_to root_url
    else
      flash.now[:danger] ="秘密の言葉が間違っています。"
      render "toppages/index"
    end
  end
    
  def destroy
  end
  
  private
  
  def confirmation(secret_words)
    @relationship = proposer.relationships.first
    if @relationship.secret_words == secret_words
      return true
    else
      return false
    end
  end
  
end