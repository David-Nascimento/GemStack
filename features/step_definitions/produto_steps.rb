Dado('que eu tenho o seguinte produto:') do |_table|
  @product = _table.hashes.first
  Database.new.delete_product(@product["nome"])
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
  tr = @prod.get_tr(@product["nome"])
  expect(tr).to have_text @product["categoria"]
  expect(tr).to have_text @product["preco"]
  expect(tr).to have_text @product["descricao"]
end

Entao('devo ver a notificacao {string}') do |expect_notice|
  expect(@prod.alert).to eql expect_notice
end