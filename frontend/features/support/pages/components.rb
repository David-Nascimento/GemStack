class Sidebar 
  include Capybara::DSL
  def logged_user
    find('.user .info span').text
  end
end
