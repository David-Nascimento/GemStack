class LoginPage 
  include Capybara::DSL
  def go
    visit 'http://pixel-web:3000/login'
  end

  def with(email, pass)
    find('#emailId').set email
    find('#passId').set pass
    click_button 'Entrar'
  end

  def alert
    return find('.card-body .alert span')
  end
end
