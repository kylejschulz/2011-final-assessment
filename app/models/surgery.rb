class Surgery < ApplicationRecord
  validates_presence_of :title, :day_of_week, :operating_room_number

  has_many :surgery_doctors
  has_many :doctors, through: :surgery_doctors
end
