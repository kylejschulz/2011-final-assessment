class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.sort_practiced
  end

end
