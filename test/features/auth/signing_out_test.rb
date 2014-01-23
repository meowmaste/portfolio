require "test_helper"

feature "user should be able to sign out and destroy session after signing in" do
  scenario "signing out" do
    visit "/"
    click_on "Log In"

    fill_in "Email", with: "user1@mysite.com"
    fill_in "Password", with: "user1"
    click_on "Sign in"
  	page.text.must_include "Signed in successfully"

  	click_on "Log Out"
  	page.text.must_include "Signed out successfully"
  end
end
