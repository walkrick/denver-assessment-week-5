class UserDatabase < Database
  def find(id)
    (all[offset_id(id)] or raise EntityNotFoundError).dup
  end
end
