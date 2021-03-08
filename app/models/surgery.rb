class Surgery < ApplicationRecord
  validates_presence_of :title, :day_of_week, :operating_room_number

  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors

  def least
    doctors.order(:years_practiced).limit(1).first
  end

  def most
    doctors.order(years_practiced: :desc).limit(1).first
  end

  def self.ordered_average_practiced
    require "pry"; binding.pry 

  end
end
