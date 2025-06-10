class SessionsController < ApplicationController
  layout 'log', only: [:new]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Sai tên tài khoản hoặc mật khẩu.'
      render :new, layout: 'log'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
