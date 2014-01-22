require "test_helper"

feature "As the site visitor, I want to see the dev's portfolio" do
  scenario "viewing all projects" do
    visit projects_path
    page.text.must_include "solar system"
    page.text.must_include "CSS"
  end

  scenario "viewing a single project" do
  	visit projects_path (projects(:portfolio))
  	page.text.must_include "meta"
  	page.text.must_include "Ruby"
  end
end
