require 'spec_helper'

describe User do

  it 'allows a user to sign up', js: true do
    user = User.new(:username => 'Bo', :password => 'pw', :password_confirmation => 'pw')
    visit '/'
    click_link 'sign-up'
    fill_in 'User name', :with => user.username
    fill_in 'Password', :with => user.password
    fill_in 'Confirm password', :with => user.password
    click_button 'Create User'
    page.should have_content "Thanks for signing up!"
  end

  it 'allows a user to log in', js: true do
    user = User.create(:username => 'Bo', :password => 'pw', :password_confirmation => 'pw')
    visit '/'
    click_link 'Log In'
    fill_in 'User name', :with => user.username
    fill_in 'Password', :with => user.password
    click_button 'Log In'
    page.should have_content "Logged in!"
  end

  it 'throw an error if log in is incorrect', js: true do
    user = User.create(:username => 'Bo', :password => 'pw', :password_confirmation => 'pw')
    visit '/'
    click_link 'Log In'
    fill_in 'User name', :with => user.username
    fill_in 'Password', :with => "fgdf"
    click_button 'Log In'
    page.should have_content "Username or password is invalid."
  end
end
