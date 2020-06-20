module ApplicationHelper
  def menu_action
    if current_user
      concat(content_tag(:li) do
        link_to 'Profile', user_path(current_user)
      end)
      content_tag(:li) do
        link_to 'Logout', logout_path
      end
    else
      concat(content_tag(:li) do
        link_to 'Login', login_path
      end)
      content_tag(:li) do
        link_to 'Sign Up', signup_path
      end
    end
  end
end
