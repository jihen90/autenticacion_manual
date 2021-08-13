class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    pass = BCrypt::Password.new(@user.password_digest)
    respond_to do |format|
      if @user.present? && pass == params[:user][:password]
        session[:user_id] = @user.id
        format.html { redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
