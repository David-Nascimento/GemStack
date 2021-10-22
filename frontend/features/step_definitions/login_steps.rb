Dado('que acesso à página principal') do
  @login_page.go
end

Quando('eu submeto minhas credenciais {string} e {string}') do |_email, _password|
  @login_page.with(_email, _password)
end

Então('devo ser autenticado') do
  sleep 5
  expect(@side.logged_user).to eql 'David'
end

# Cenario 2
Então('devo ver uma mensagem de alerta {string}') do |message|
  sleep 5
  expect(@login_page.alert.text).to eql message
end
