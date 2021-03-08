require 'rails_helper'

describe "When I visit a surgery's show page" do
  before :each do
    @surgery_1 = create(:surgery, day_of_week: 'monday')

    @doctor_1 = create(:doctor, years_practiced: 1)
    @doctor_2 = create(:doctor, years_practiced: 4)
    @doctor_3 = create(:doctor, years_practiced: 3)
    @doctor_4 = create(:doctor, years_practiced: 2)

    @surgery_1.doctors << [@doctor_1, @doctor_2, @doctor_3, @doctor_4]
    visit surgery_path(@surgery_1)
  end

  it "Then I see the surgery's title, day of the week, and operating room number" do

    expect(page).to have_content(@surgery_1.title)
    expect(page).to have_content(@surgery_1.day_of_week)
    expect(page).to have_content(@surgery_1.operating_room_number)
  end

  it "And I see the names and years practiced of all doctors performing this surgery" do

    within("#doctor-#{@doctor_1.id}") do
      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.years_practiced)
    end

    within("#doctor-#{@doctor_3.id}") do
      expect(page).to have_content(@doctor_3.name)
      expect(page).to have_content(@doctor_3.years_practiced)
    end
  end

  it "And I see two sections, one for 'Most experienced doctor' and one for 'Least experienced doctor'" do
    within("#most_experienced") do
      expect(page).to have_content(@doctor_2.name)
      expect(page).to have_content(@doctor_2.years_practiced)
    end

    within("#least_experienced") do
      expect(page).to have_content(@doctor_1.name)
      expect(page).to have_content(@doctor_1.years_practiced)
    end
  end
end
