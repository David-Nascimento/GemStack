#Suite de teste
describe "POST /products" do
    def auth(payload)
        return HTTParty.post(
             "http://pixel-api:3333/auth",
             body: payload.to_json,
             headers: { "Content-Type" => "application/json"},
         )
     end

    def create(payload, token)
       return HTTParty.post(
            "http://pixel-api:3333/products",
            body: payload.to_json,
            headers: { 
                "Content-Type" => "application/json", 
                "Authorization" => "JWT " + token
            },
        )
    end

    # cenario de teste
    it "Novo produto" do
        
        payload = {
            title: "Contra",
            category: "Super Nintendo",
            producers: ["Nintendo", "Konami"], 
            price: "299.99", 
            description: "Um jogo foda de tiro",
            cover: "contra.jpg"
          }

        resp_login = auth({
            email: "david@ninjapixel.com",
            password: "pwd123",
        })
        token = resp_login.parsed_response["token"]

        resp = create(payload, token)

        expect(resp.code).to eql 200
    end
end