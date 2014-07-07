require "spec_helper"

feature "Home" do
  scenario "should show Contacts"
  visit "/"

  expect(page).to have_content("Contacts")
end

scenario "should have login link with form" do
visit "/"

expect(page).to have_link("Login", options = {href: "/login"})
expect("/login").to have_content("Username", "Password")
end