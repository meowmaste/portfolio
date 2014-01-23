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
end