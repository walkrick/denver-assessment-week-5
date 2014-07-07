require "sinatra"
require "./lib/contact_database"
require "./lib/user_database"

class ContactsApp < Sinatra::Base

  def initialize
    super
    @contact_database = ContactDatabase.new
    @user_database = UserDatabase.new
  end

  get "/" do
    "Hello"
  end

end
