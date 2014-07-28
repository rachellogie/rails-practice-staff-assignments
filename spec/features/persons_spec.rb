require 'rails_helper'

feature 'persons' do

  scenario 'user can see person show page' do
    create_user
    create_person
    sign_in_user
    click_on 'Mrs. Rachel Example'
    expect(page).to have_content 'Show page for Mrs. Rachel Example'
  end
end