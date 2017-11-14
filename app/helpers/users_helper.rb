module UsersHelper
  def user_has_posts?(user)
    user.comments.count != 0 || user.posts.count != 0
  end
end
