#language: pt

Funcionalidade: Exclusão de produtos
    Para que eu possa manter meu catálogo organizado
    Sendo um administrador de catálogo que possui um produto indesejado
    Posso remover o produto

    @auth 
    Cenario: Remover produto

        Dado que "mario_bros" é um produto indesejado
        Quando eu solicito a exclusão desse item
        E confirmo a solicitação
        Então não devo ver este item na lista

    @auth @doing
    Cenario: Desistir a exclusão

        Dado que "streetf2" é um produto indesejado
        Quando eu solicito a exclusão desse item
        Mas eu cancelo a solicitação
        Então este item deve permancer na lista