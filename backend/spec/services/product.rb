class Product 
    include HTTParty
    base_uri "http://pixel-api:3333"
    format :json


    def initialize(email, password)
        payload = {email: email, password: password}

        resp = self.class.post("/auth", body: payload)
        @token = resp.parsed_response["token"]

        @headers = {
            "Authorization" => "JWT " + @token
        }
    end

    def create(payload) 
        self.class.post("/products", body: payload, headers: @headers)
    end
end