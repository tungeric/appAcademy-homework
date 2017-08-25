module ApplicationHelper
  def auth_token
    html_auth = '<input type="hidden" name="authenticity_token" value="#{form_authenticity_token}"/>'
    html_auth.html_safe
  end
end
