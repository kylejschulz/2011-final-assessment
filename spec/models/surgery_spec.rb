require 'rails_helper'

RSpec.describe Surgery, type: :model do
  describe 'relationships' do
      it { should have_many :surgery_doctors }
      it {should have_many(:doctors).through(:surgery_doctors)}
  end

  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :day_of_week}
    it {should validate_presence_of :operating_room_number}
  end
end
