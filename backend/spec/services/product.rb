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

    def list
        self.class.get("/products" , headers: @headers)
    end
   
    def unique(product_id)
        self.class.get("/products/" + product_id.to_s, headers: @headers)
    end

    def remove(product_id)
        self.class.delete("/products/" + product_id.to_s, headers: @headers)
    end

    def updated(product_id)
        self.class.put("/products/" + product_id.to_s, headers: @headers)
    end
end