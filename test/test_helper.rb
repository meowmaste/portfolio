ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "simplecov"
SimpleCov.start 'rails'


class ActiveSupport::TestCase

  fixtures :all

end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end
def sign_in(role = :editor)
	visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: "password"
    click_on "Sign in"
end