class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # アプリ用3
      # ContactMailer.contact_mail(@contact).deliver
      # flash[:success] = "お問い合わせを受け付けました"
      # redirect_to root_path
      # LP用3
      redirect_to root_path
    else
      flash[:danger] = "メールアドレスかお問い合わせ内容に不備があります。"
      render "toppages/index"
    end
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:email, :message)
  end
  
end
