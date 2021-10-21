#Suite de teste
describe "POST /users" do

    def auth(payload)
       return HTTParty.post(
            "http://pixel-api:3333/auth",
            body: payload.to_json,
            headers: { "Content-Type" => "application/json"},
        )
    end

    # cenario de teste
    it "criar novo usuario" do
        
        payload = {
            email: "david@ninjapixel.com",
            password: "pwd123",
        }

        resp = auth(payload)

        expect(resp.code).to eql 200
        expect(resp.parsed_response["token"].length).to eql 147
    end

    it "senha incorreta" do
        payload = {
            email: "david@ninjapixel.com",
            password: "123",
        }
        
        resp = auth(payload)
        
        expect(resp.code).to eql 401
    end
end