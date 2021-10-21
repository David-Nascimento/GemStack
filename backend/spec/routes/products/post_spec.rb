#Suite de teste
describe "POST /products" do

    before(:all) do
        @product = Product.new("david@ninjapixel.com", "pwd123")
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

        Database.new.remove_product(payload[:title])
        resp = @product.create(payload)
        expect(resp.code).to eql 200

    end

    it "Produto duplicado" do
        payload = {
            title: "Alex Kid",
            category: "Master System",
            producers: ["Sega"], 
            price: "19.99", 
            description: "Outro Game muito Legal",
            cover: "alex.jpg"
        }

        Database.new.remove_product(payload[:title])
        @product.create(payload)

        resp = @product.create(payload)

        expect(resp.code).to eql 409
        expect(resp.parsed_response["msg"]).to eql "title must be unique"
    end

    it "titulo nao informado" do
        payload = {
            title: "",
            category: "Master System",
            producers: ["Sega"], 
            price: "19.99", 
            description: "Outro Game muito Legal",
            cover: "alex.jpg"
        }
        resp = @product.create(payload)

        expect(resp.code).to eql 400
        expect(resp.parsed_response["msg"]).to eql "Oops! title cannot be empty"
    end

    it "Categoria nao informada" do
        payload = {
            title: "Alex Kid",
            category: "",
            producers: ["Sega"], 
            price: "19.99", 
            description: "Outro Game muito Legal",
            cover: "alex.jpg"
        }

        resp = @product.create(payload)

        expect(resp.code).to eql 400
        expect(resp.parsed_response["msg"]).to eql "Oops! category cannot be empty"
    end

    it "preco nao informado" do
        payload = {
            title: "Alex Kid",
            category: "Master System",
            producers: ["Sega"], 
            price: "", 
            description: "Outro Game muito Legal",
            cover: "alex.jpg"
        }

        resp = @product.create(payload)

        expect(resp.code).to eql 400
        expect(resp.parsed_response["msg"]).to eql "Oops! price cannot be empty"
    end
end