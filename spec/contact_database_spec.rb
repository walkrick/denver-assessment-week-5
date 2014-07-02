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

  describe "#find" do
    it "finds the contact by the id" do
      contact_database.insert(:name => "Spencer", :email => "first@example.com")
      contact_database.insert(:name => "Jeff", :email => "jetaggart@example.com")
      contact_database.insert(:name => "Hunter", :email => "hunter@example.com")

      found_contact = contact_database.find(2)

      expect(found_contact).to include(:name => "Jeff", :email => "jetaggart@example.com")

      found_contact = contact_database.find(3)

      expect(found_contact).to include(:name => "Hunter", :email => "hunter@example.com")
    end

    it "raises an error if no contact can be found" do
      expect {
        contact_database.find(1)
      }.to raise_error(ContactDatabase::ContactNotFoundError)
    end
  end

  describe "#delete" do
    it "deletes at the correct id" do
      contact_database.insert(:name => "First", :email => "mail@example.com")
      contact_database.delete(1)

      expect(contact_database.all).to eq([])
    end

    it "raises an error the an incorrect id is given" do
      expect {
        contact_database.delete(1)
      }.to raise_error(ContactDatabase::ContactNotFoundError)
    end
  end
end
