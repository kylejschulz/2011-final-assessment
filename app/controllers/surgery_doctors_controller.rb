class SurgeryDoctorsController < ApplicationController

  def create
    surgery = Surgery.find(params[:surgery_id])
    doctor = Doctor.find_by(name: params[:doctor_name])
    surgery_doctor = SurgeryDoctor.new(surgery_id: surgery.id, doctor_id: doctor.id)
    surgery_doctor.save
    redirect_to surgery_path(surgery)
  end

end
