require "test_helper"

feature "existing user should be able to sign in again" do
  scenario "signing in with existing user" do
    visit "/"
    click_on "Log In"

    fill_in "Email", with: "user1@mysite.com"
    fill_in "Password", with: "user1"
    click_on "Sign in"
  	page.text.must_include "Signed in successfully"
  end

  scenario "sign in with twitter works" do
    visit root_path
    click_on "Log In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
    click_on "Sign in with Twitter"
    save_and_open_page
    page.must_have_content "Signed in!"
  end
end