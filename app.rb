require "sinatra"
require "./lib/contact_database"
require "./lib/user_database"

class ContactsApp < Sinatra::Base

  def initialize
    super
    @contact_database = ContactDatabase.new
    @user_database = UserDatabase.new

    @user_database.insert(username: "Hunter", password: "puglyfe")
    @user_database.insert(username: "Spencer", password: "spen123")
  end

  get "/" do
    "Hello week 5"
  end

end
