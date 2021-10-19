Dado('que eu tenho o seguinte produto:') do |_table|
  @product = _table.hashes.first
  Database.new.delete_product(@product['nome'])
end

Dado('os produtores são:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  @producers = table.hashes
end

Dado('este item foi cadastrado') do
  steps %(
    Quando eu faço o cadastro desse item
  )
end

Quando('eu faço o cadastro desse item') do
  @prod.go_to_form
  @prod.create(@product, @producers)
end

Entao('devo ver este item na lista de produtos') do
  tr = @prod.get_tr(@product['nome'])
  expect(tr).to have_text @product['categoria']
  expect(tr).to have_text @product['preco']
  expect(tr).to have_text @product['descricao']
end

Entao('devo ver a notificacao {string}') do |expect_notice|
  expect(@prod.alert).to eql expect_notice
end

## Cenario de exclusao de produtos
Dado('que {string} é um produto indesejado') do |_string|
  @product = {
    'nome' => 'Super Mario Bros',
    'categoria' => 'Nintendo',
    'preco' => '19.99',
    'descricao' => 'Um jogo muito dificil de terminar!',
    'imagem' => 'mario1.jpg'
  }
  @producers = []
  Database.new.delete_product(@product['nome'])

  steps %(
    Quando eu faço o cadastro desse item
  )
end

Quando('eu solicito a exclusão desse item') do
  @prod.remove(@product['nome'])
end

Quando('confirmo a solicitação') do
  @prod.confirm_removal
end

Então('não devo ver este item na lista') do
  page.has_no_movie
end
