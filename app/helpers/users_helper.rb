module UsersHelper
  def menu_action
    if current_user
      # concat(content_tag(:li, class:"profile-menu") do
      #   link_to 'Profile', user_path(current_user)
      # end)
      # concat(content_tag(:li, class:"profile-menu") do
      #   link_to "Home", root_path
      # end)
      concat(content_tag(:li, class:"profile-menu") do
        link_to 'All Projects', projects_path
      end)
      concat(content_tag(:li, class:"profile-menu") do
        link_to 'All Groups', groups_path
      end)
      content_tag(:li, class:"profile-menu") do
        link_to 'Logout', logout_path
      end
    else
      concat(content_tag(:li, class:"profile-menu") do
        link_to 'Login', login_path
      end)
      content_tag(:li, class:"profile-menu") do
        link_to 'Sign Up', signup_path
      end
    end
  end
end
