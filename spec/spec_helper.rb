require "database"
require "contact_database"
require "capybara/rspec"
require "./app"

Capybara.app = ContactsApp
