require 'rails_helper'

feature 'persons' do

  before do
    create_user
    @person = create_person
    sign_in_user
  end

  scenario 'user can see person show page' do
    click_on 'Mrs. Rachel Example'
    expect(page).to have_content 'Show page for Mrs. Rachel Example'
  end

  scenario 'user can edit person ' do
    click_on 'Mrs. Rachel Example'
    click_on 'Edit'
    fill_in 'First name', with: 'Potato'
    fill_in 'Last name', with: 'Head'
    click_on 'Update Person'
    expect(page).to have_content 'Mrs. Potato Head'
  end

  scenario 'user will see error message if enters invalid data' do
    click_on 'New Person'
    click_on 'Create Person'
    expect(page).to have_content "First name can't be blank if title is blank and vice versa."
  end

end