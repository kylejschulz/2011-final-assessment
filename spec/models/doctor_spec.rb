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
end
