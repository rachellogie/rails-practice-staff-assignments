require 'rails_helper'

feature 'assignments' do

  before do
    create_user
    @person = create_person
    sign_in_user
    ["Northeast", "Midwest", "Mountain West", "Northwest", "Southwest", "Deep south", "Texas"].each do |name|
      Location.create!(name: name)
    end
  end

  scenario 'user can assign a location to a person' do
    visit person_path(@person)
    click_on 'Add Location'
    select 'Midwest', from: 'location[place]'
    fill_in 'Role', with: 'Manager'
    click_on 'Create Assignment'
    expect(page).to have_content 'Manager'
    expect(page).to have_content 'Midwest'
  end

  scenario 'user cannot assign a duplicate location/role to a person' do
    visit person_path(@person)
    click_on 'Add Location'
    select 'Midwest', from: 'location[place]'
    fill_in 'Role', with: 'Manager'
    click_on 'Create Assignment'

    click_on 'Add Location'
    select 'Midwest', from: 'location[place]'
    fill_in 'Role', with: 'Manager'
    click_on 'Create Assignment'

    expect(page).to have_content 'You already have this assignment!'
  end

  scenario 'user can edit assignments' do
    @person.assignments.create!(location_id: "1", role: "director")
    visit person_path(@person)
    click_on 'Edit Assignment'
    fill_in 'Role', with: 'cuteness'
    click_on 'Update Assignment'
    expect(page).to have_content 'cuteness'
  end

  scenario 'user can delete assignments' do
    @person.assignments.create!(location_id: "1", role: "director")
    visit person_path(@person)
    expect(page).to have_content 'director'
    click_on 'Delete Assignment'
    expect(page).to_not have_content 'director'
  end

  scenario 'you can see total number of locations on the homepage' do
    @person.assignments.create!(location_id: "1", role: "director")
    @person.assignments.create!(location_id: "2", role: "director")
    @person.assignments.create!(location_id: "3", role: "director")
    @person.assignments.create!(location_id: "3", role: "other thing")

    visit root_path
    expect(page).to have_content '3'

  end
end


