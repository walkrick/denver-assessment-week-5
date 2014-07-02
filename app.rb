require "sinatra"
require "./lib/contact_database"

class ContactsApp < Sinatra::Base

  def initialize
    super
    @contacts = ContactDatabase.new
  end

  get "/" do
    "Hello"
  end

end
