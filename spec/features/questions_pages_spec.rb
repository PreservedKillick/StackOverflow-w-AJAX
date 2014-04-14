require 'spec_helper'

describe Question do

  it 'allows a user to post a new question', js: true do
    @user = User.create(:username => 'Bo', :password => 'pw', :password_confirmation => 'pw')
    visit '/'
    click_link 'Log In'
    fill_in 'User name', :with => @user.username
    fill_in 'Password', :with => @user.password
    click_button 'Log In'
    click_link 'Ask a Question'

    fill_in 'Question', :with => "How does AJAX work?"
    click_button 'Create Question'
    save_and_open_page
    page.should have_content "Question has been posted"
  end

end
