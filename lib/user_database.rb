class UserDatabase
  def initialize
    @users = []
  end

  def insert(user)
    user = user.dup
    user[:id] = next_id

    @users.push(user)

    user.dup
  end

  def find(id)
    (@users[offset_id(id)] or raise UserNotFoundError).dup
  end

  class UserNotFoundError < RuntimeError; end

  private

  def next_id
    @users.length + 1
  end

  def offset_id(id)
    id - 1
  end
end
