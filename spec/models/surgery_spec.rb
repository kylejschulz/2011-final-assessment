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

  describe "instance methods" do
    before (:each) do
      @surgery_1 = create(:surgery, day_of_week: 'monday')
      @doctor_1 = create(:doctor, years_practiced: 1)
      @doctor_2 = create(:doctor, years_practiced: 4)
      @doctor_3 = create(:doctor, years_practiced: 3)
      @doctor_4 = create(:doctor, years_practiced: 2)
      @surgery_1.doctors << [@doctor_1, @doctor_2, @doctor_3, @doctor_4]
  end

    it "returns least_experienced doctor" do
      expect(@surgery_1.least).to eq(@doctor_1)
    end

    it "returns most_experienced doctor" do
      expect(@surgery_1.most).to eq(@doctor_2)
    end
  end

end
