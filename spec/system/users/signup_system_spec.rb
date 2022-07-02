require 'rails_helper'

RSpec.describe 'Sign up page', type: :system do
  before :example do
    driven_by(:rack_test)

    visit new_user_registration_path
  end

  it 'should display welcoming message' do
    expect(page).to have_content('REGISTER')
  end

  it 'should display all fields' do
    find_field('Name')
    find_field('Email')
    find_field('Password')
    find_field('Password confirmation')
    find_button('Next')
  end

  it 'should display errors if all fields are blank' do
    click_button('Next')

    expect(page).to have_content('4 errors prohibited this user from being saved:')
  end

  it 'should display error if password is less than 6 characters' do
    fill_in('Name', with: 'Edward')
    fill_in('Email', with: 'you@gmail.com')
    fill_in('Password', with: 'root')
    fill_in('Password confirmation', with: 'root')

    click_button('Next')

    expect(page).to have_content(
      'Password is too short (minimum is 6 characters)'
    )
  end

  it 'should display error if password doesn\'t match password confirmation' do
    fill_in('Name', with: 'Edward')
    fill_in('Email', with: 'you@gmail.com')
    fill_in('Password', with: 'root123')
    fill_in('Password confirmation', with: 'not_the_same')

    click_button('Next')

    expect(page).to have_content(
      "Password confirmation doesn't match Password"
    )
  end

  it 'should create user' do
    fill_in('Name', with: 'Edward')
    fill_in('Email', with: 'you@gmail.com')
    fill_in('Password', with: 'root123')
    fill_in('Password confirmation', with: 'root123')

    click_button('Next')

    expect(page).to have_current_path('/groups')
  end

  it 'should display all links' do
    click_button 'Next'
  end

  it 'should click log in link and redirect to log in form' do
    click_button 'Next'

    expect(page).to have_current_path('/users')
  end
end
