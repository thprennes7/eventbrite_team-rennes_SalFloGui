module UsersHelper
  def is_current_user?(user)
    @user = user
    current_user == @user
  end
end
