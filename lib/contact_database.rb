class ContactDatabase
  def initialize
    @contacts = []
  end

  def insert(contact)
    contact = contact.dup
    contact[:id] = next_id

    @contacts.push(contact)

    contact.dup
  end

  def all
    @contacts.dup
  end

  class ContactNotFoundError < RuntimeError ; end

  private

  def next_id
    @contacts.length + 1
  end

  def offset_id(id)
    id - 1
  end
end
