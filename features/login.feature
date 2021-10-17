#language:pt

        Funcionalidade: Login
            Para que eu possa gerenciar os jogos do meu catálogo NinjaPixel
            Sendo um Administrador de catálogo
            Posso acessar o sistema com meu e-mail e senha
        
        Contexto:
            Dado que acesso à página principal

        @login
        Cenario: Acessar o portal
            Quando eu submeto minhas credenciais "david@ninjapixel.com" e "pwd123"
            Então devo ser autenticado

        Esquema do Cenario: Tentar logar
            Quando eu submeto minhas credenciais "<email>" e "<password>"
            Então devo ver uma mensagem de alerta "<mensagem>"

            Exemplos:
            | email                | password | mensagem                     |
            | david@ninjapixel.com | 123      | Usuário e/ou senha inválidos |
            | 404@ninjapixel.com   | pwd123   | Usuário e/ou senha inválidos |
            |                      | pwd123   | Opps. Informe o seu email!   |
            | david@ninjapixel.com |          | Opps. Informe a sua senha!   |
