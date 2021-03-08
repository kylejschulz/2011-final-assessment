require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit the surgery index" do
    before(:each) do
      @surgery_1 = create(:surgery, day_of_week: 'monday')
      @surgery_2 = create(:surgery, day_of_week: 'tuesday')
      @surgery_3 = create(:surgery, day_of_week: 'wednesday')
      @surgery_4 = create(:surgery, day_of_week: 'thrusday')

      @doctor_1 = create(:doctor, years_practiced: 1)
      @doctor_2 = create(:doctor, years_practiced: 4)
      @doctor_3 = create(:doctor, years_practiced: 3)
      @doctor_4 = create(:doctor, years_practiced: 2)
      @surgery_1.doctors << [@doctor_1, @doctor_2]
      @surgery_2.doctors << [@doctor_2, @doctor_3,@doctor_4, @doctor_1]
      @surgery_3.doctors << [@doctor_2, @doctor_3]

      visit surgerys_path
    end

    it "I see each surgery including its title, day of week, and operating room number" do
      save_and_open_page

      within("#surgery-#{@surgery_1.id}") do
        expect(page).to have_content(@surgery_1.title)
        expect(page).to have_content(@surgery_1.day_of_week)
        expect(page).to have_content(@surgery_1.operating_room_number)
      end

      within("#surgery-#{@surgery_2.id}") do
        expect(page).to have_content(surgery__2.title)
        expect(page).to have_content(surgery__2.day_of_week)
        expect(page).to have_content(surgery__2.operating_room_number)
      end
    end

    it "And next to each surgery I see the average years practiced of doctors performing that surgery" do
      within("#surgery-#{@surgery_1.id}") do
        expect(page).to have_content(@surgery_1.average_years_practiced)
      end

      within("#surgery-#{@surgery_2.id}") do
        expect(page).to have_content(@surgery_2.average_years_practiced)
      end

    end

    it "And I see that the surgeries on this page are ordered by average years practiced from greatest to least" do

        expect(@surgery_2.name).to appear_before(@surgery_3.name)
        expect(@surgery_3.name).to appear_before(@surgery_1.name)
    end
  end
end
