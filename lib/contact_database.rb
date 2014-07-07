class ContactDatabase < Database
  def find_for_user(user_id)
    all.select { |contact| contact[:user_id] == user_id }
  end
end
