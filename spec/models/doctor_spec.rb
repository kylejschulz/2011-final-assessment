require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
      it { should have_many :surgery_doctors }
      it {should have_many(:surgerys).through(:surgery_doctors)}

  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :years_practiced}
    it {should validate_presence_of :university}
  end

  describe 'class methods' do
    it 'returns collection ordered by years_practiced descending' do
      @doctor_1 = create(:doctor, years_practiced: 1)
      @doctor_2 = create(:doctor, years_practiced: 4)
      @doctor_3 = create(:doctor, years_practiced: 3)
      @doctor_4 = create(:doctor, years_practiced: 2)

      expected = [@doctor_2, @doctor_3, @doctor_4, @doctor_1]

      expect(Doctor.sort_practiced).to eq(expected)
    end
  end
end
