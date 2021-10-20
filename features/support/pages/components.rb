class Sidebar < BasePage
  def logged_user
    find('.user .info span').text
  end
end
