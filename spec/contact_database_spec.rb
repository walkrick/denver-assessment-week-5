require "spec_helper"

describe ContactDatabase do
  let(:contact_database) { ContactDatabase.new }

  describe "#insert" do
    it "returns the object if it succeeds" do
      contact_as_hash = {:name => "Jeff", :email => "jetaggart@example.com"}

      result = contact_database.insert(contact_as_hash)

      expect(result).to include({:name => "Jeff", :email => "jetaggart@example.com"})
    end

    it "gives the contact an id" do
      contact_as_hash = {:name => "Jeff", :email => "jetaggart@example.com"}

      contact = contact_database.insert(contact_as_hash)

      expect(contact[:id]).to eq(1)
    end

    it "offsets the id by how many contacts exist" do
      contact_database.insert({:name => "Jeff", :email => "jetaggart@example.com"})
      second_contact = contact_database.insert(:name => "Hunter", :email => "hunter@example.com")

      expect(second_contact[:id]).to eq(2)
    end
  end

end
