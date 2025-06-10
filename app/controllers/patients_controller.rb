class PatientsController < ApplicationController
  before_action :set_user

  def new
    @patient = @user.build_patient()
  end

  def create
    @patient = @user.build_patient(patient_params)
    if @patient.save
      flash[:success] = "Cập nhật thông tin thành công"
      redirect_to @patient
    else
      render :new
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def patient_params
      params.require(:patient).permit(:name, :gender, :phone, :email)
    end
end
