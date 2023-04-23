
class PasswordResetsController < ApplicationController

  def new
    
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to login_path
    else
      render :edit
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, alert: "expired token"
  end

  def create
    @user = User.find_by(email: params[:email])
    
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_later
    end
    #send email 
    redirect_to login_path
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
