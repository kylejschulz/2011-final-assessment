require 'rails_helper'

describe "When I visit a surgery's show page" do
  before :each do
    @surgery_1 = create(:surgery)

    @doctor_1 = (:doctor)
    @doctor_2 = (:doctor)
    @doctor_3 = (:doctor)
    @doctor_4 = (:doctor)

    @surgery_1.doctors << [@doctor_1, @doctor_2, @doctor_3, @doctor_4]
  end

  it "Then I see the surgery's title, day of the week, and operating room number" do
    visit surgery_path(@surgery1)

    expect(page).to have_content(@surgery_1.title)
    expect(page).to have_content(@surgery_1.day_of_week)
    expect(page).to have_content(@surgery_1.operating_room_number)
  end

  it "And I see the names and years practiced of all doctors performing this surgery" do
    visit surgery_path(@surgery1)

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
      expect(page).to have_content(@doctor_3.name)
      expect(page).to have_content(@doctor_3.years_practiced)
    end

    within("#least_experienced") do
      expect(page).to have_content(@doctor_3.name)
      expect(page).to have_content(@doctor_3.years_practiced)
    end


  end
end

Then I see the surgery's title, day of the week, and operating room number
And I see the names and years practiced of all doctors performing this surgery
And I see two sections, one for 'Most experienced doctor' and one for 'Least experienced doctor'
And in those two sections I see the two doctors who are performing this surgery with the most and least years practiced
in the appropriate section including thier name and their years practiced.
