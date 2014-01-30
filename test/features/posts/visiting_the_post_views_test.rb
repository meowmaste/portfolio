require "test_helper"

feature "Visiting The Post Views" do
  scenario "with existing posts, show list" do
    #Given existing posts
    Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.", published: true)

    #When I visit /posts
    visit posts_path

    #Then the existing posts should be loaded
    page.text.must_include "Becoming a Code Fellow"
  end

  scenario "as an author, I want to only see my own posts so that I can focus on my work" do
  	Post.create(title: "Becoming a unicorn", body: "Means growing one horn.", author: users(:author))
  	sign_in(:author)
  	visit posts_path
	page.text.must_include "Becoming a unicorn"
  	page.wont_have_content "I learned web development!"
  end 

  scenario "as an editor, I want to see all posts regardless of published status in the blog index so I can choose which to publish" do
  	sign_in(:editor)
  	visit posts_path
  	page.text.must_include "I learned web development!"
  	page.text.must_include "PostgreSQL"
  end

  scenario "as a site visitor (user), I want to read published posts" do
  	visit posts_path
  	page.text.must_include "how I learned web development!"
  	page.wont_have_content "PostgreSQL"
  end 

end

