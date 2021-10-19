class ProductPage
  include Capybara::DSL

  def go_to_form
    find('.product-add').click
  end

  def create(product, producers)
    find('input[name=title]').set product['nome']

    find('input[placeholder=Gategoria]').click
    find('.el-select-dropdown__item', text: product['categoria'], match: :prefer_exact).click
    find('input[name=price]').set product['preco']

    input_producers(producers) if producers.size > 0

    find('textarea[name=description]').set product['descricao']

    upload(product['imagem'])

    click_button 'Cadastrar'
  end

  def remove(name)
    found = get_tr(name)
    # escopo
    found.find('.btn-trash').click
  end

  def confirm_removal
    find('.swal2-confirm').click
  end

  def has_no_movie?(name)
    return has_no_css?('table tbody tr', text: name)
  end

  def get_tr(value)
    find('table tbody tr', text: value)
  end

  def alert
    find('.alert').text
  end

  private

  def upload(image)
    rel_path = '/features/support/images/' + image
    image_file = File.join(Dir.pwd, rel_path)

    Capybara.ignore_hidden_elements = false
    attach_file('upcover', image_file)
    Capybara.ignore_hidden_elements = true
  end

  def input_producers(producers)
    producers_element = find('.producers')

    producers.each do |p|
      producers_element.set p['produtor']
      producers_element.send_keys :tab
    end
  end
end
