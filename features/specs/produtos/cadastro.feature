#language: pt

Funcionalidade: Cadastro de produtos
    Para que eu possa disponibilizar produtos no catálogo
    Sendo um administrador de catálogo
    Posso cadastrar um novo produto

    @auth 
    Cenario: Novo produto

        Dado que eu tenho o seguinte produto:
            | nome        | categoria      | preco | produtores | descricao               | imagem          |
            | Donkey Kong | Super Nintendo | 49.99 | Konami     | Um jogo muito divertido | donkey-kong.jpg |
        E os produtores são:
            | produtor  |
            | Konami    |
            | Nintendo  |
        Quando eu faço o cadastro desse item
        Entao devo ver este item na lista de produtos

    @auth @smoke
    Cenario: Duplicado
        O gestor de catálogo tenta cadastar um produto, porem o mesmo
        já foi cadastrado em outro momento, portanto o sistema
        deve notificar o usuário informando que o produto já existe.

    Dado que eu tenho o seguinte produto:
        | nome        | categoria      | preco | descricao                | imagem          |
        | Golden Axe  | Mega Drive     | 39.99 | Um Classico top demais!! | golden-axe.jpg  |
    E os produtores são:
        | produtor  |
        | Sega      |
    Mas este item foi cadastrado
    Quando eu faço o cadastro desse item
    Entao devo ver a notificacao "Oops - Este produto já foi cadastrado!"