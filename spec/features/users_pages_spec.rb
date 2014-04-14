require 'spec_helper'

describe User do

  it 'allows a user to sign up', js: true do
    user = User.create(:username => 'Joe', :password => 'pw', :password_confirmation => 'pw')
    visit '/'
    click_link 'sign-up'
    fill_in 'User name', :with => user.username
    fill_in 'Password', :with => user.password
    fill_in 'Confirm password', :with => user.password
    click_button 'Create User'
    page.should have_content "Thanks for signing up!"
  end

end
