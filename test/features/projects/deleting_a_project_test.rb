require "test_helper"

feature "As the site owner, I want to delete a portfolio item so that I can keep the list focused on best work" do
  scenario "deleting an existing project" do
    name = projects(:portfolio).name
    visit projects_path

  	 page.find("a[href='#{project_path(projects(:portfolio))}?locale=en'][data-method='delete']").click
    
    page.wont_have_content name

   end
end
