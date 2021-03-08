require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit the doctor index ('/doctors')" do
    before(:each) do
      @doctor_1 = create(:doctor, years_practiced: 1)
      @doctor_2 = create(:doctor, years_practiced: 4)
      @doctor_3 = create(:doctor, years_practiced: 3)
      @doctor_4 = create(:doctor, years_practiced: 2)
      visit doctors_path
    end

    it "Then I see the all Doctors including their name, years practiced, and university" do
      save_and_open_page
      
      within("#doctor-#{@doctor_1.id}") do
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_1.years_practiced)
        expect(page).to have_content(@doctor_1.university)
      end

      within("#doctor-#{@doctor_2.id}") do
        expect(page).to have_content(@doctor_2.name)
        expect(page).to have_content(@doctor_2.years_practiced)
        expect(page).to have_content(@doctor_2.university)
      end
    end

    it "Then I see all doctors in the system listed in order by years_practiced from most to least" do

        expect(@doctor_2.name).to appear_before(@doctor_3.name)
        expect(@doctor_3.name).to appear_before(@doctor_4.name)
        expect(@doctor_4.name).to appear_before(@doctor_1.name)
    end
  end
end
