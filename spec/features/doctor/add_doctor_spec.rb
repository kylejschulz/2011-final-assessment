require 'rails_helper'

describe "When I visit a surgery's show page" do
  before :each do
    @surgery_1 = create(:surgery, day_of_week: 'monday')

    @doctor_1 = create(:doctor, years_practiced: 1)
    @doctor_2 = create(:doctor, years_practiced: 4)
    @doctor_3 = create(:doctor, years_practiced: 3)
    @doctor_4 = create(:doctor, years_practiced: 2)
    @surgery_1.doctors << [@doctor_1, @doctor_2, @doctor_3]


  end

  it "I see a field with instructions to 'Add A Doctor To This Surgery'" do
    visit surgery_path(@surgery_1)

    expect(page).to have_content('Add a Doctor')
    expect(page).to have_content(@surgery_1.day_of_week)
    expect(page).to have_content(@surgery_1.operating_room_number)
  end

  it "When I input the name of an existing Doctor into that field And I click submit" do

    visit surgery_path(@surgery_1)

    fill_in :name, :with => @doctor_4.name
    click_button('Submit')

    expect(current_path).to eq(surgery_path(@surgery_1))

    expect(page).to have_content(@doctor_4.name)
    expect(page).to have_content(@doctor_4.years_practiced)
  end
end
