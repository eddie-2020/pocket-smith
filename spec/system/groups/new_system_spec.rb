require 'rails_helper'

RSpec.describe 'Groups new page', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user, :confirmed)
    sign_in @user
    visit new_group_path
  end

  it 'should display welcoming message' do
    expect(page).to have_content('Add Group')
  end

  it 'should display all fields' do
    find_field 'Name'
    find_field 'Icon'
  end

  it 'should display all links' do
    find(:css, 'bi.bi-caret-left-fill')
    find_button 'Save'
  end

  it 'should create a group with valid fields' do
    fill_in 'Name', with: 'Personal'
    fill_in 'Icon', with: 'https://www.flaticon.com/premium-icon/students_2995620?term=student&page=1&position=2&page=1&position=2&related_id=2995620&origin=search'
    click_button 'Save'

    expect(page).to have_current_path(groups_path)
    expect(page).to have_content('Personal')
    expect(page).to have_content('Successfully created a group.')
  end

  it 'should not create a group if one of the fields is empty' do
    click_button('Save')

    expect(page).to_not have_content('Successfully created a group.')
    expect(page).to have_content('Failed to create a group.')
  end
end
