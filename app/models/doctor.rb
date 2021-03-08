class Doctor < ApplicationRecord
  validates_presence_of :name, :years_practiced, :university

  has_many :surgery_doctors
  has_many :surgerys, through: :surgery_doctors

  def self.sort_practiced
    order(years_practiced: :desc)
  end
end
