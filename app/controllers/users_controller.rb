class UsersController < ApplicationController
  # Change full layout only when signing up
  layout 'log', only: [:new]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Đâng ký thành công"
      redirect_to new_patient_path(user_id: @user.id)
    else 
      render :new, layout: 'log'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :role)
    end
end
