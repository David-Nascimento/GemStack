#Suite de teste
describe "POST /products" do
    before(:all) do
        @product = Product.new("david@ninjapixel.com", "pwd123")
        @data = YAML.load_file(File.join(Dir.pwd, "spec/fixtures/post.yaml"))
    end
    context "dado que eu tenha um produto" do
        before(:all) do
            @payload = @data["contra"]
            Database.new.remove_product(@payload["title"])
        end
        context "quando cadastro esse produto" do
            before(:all) do
                @resp = @product.create(@payload)
            end
            it "entao deve retornar 200" do
                expect(@resp.code).to eql 200
            end
        end
    end

    context "Dado que eu o produto e duplicado" do
        before(:all) do
            @payload = @data["dup"]
            Database.new.remove_product(@payload["title"])
            @product.create(@payload)
        end

        context "Quando eu faco o cadastro" do
            before(:all) do
                @resp = @product.create(@payload)
            end
            it "Entao retorna 409" do
                expect(@resp.code).to eql 409                
            end
            it 'E retorna o title title must be unique' do
                expect(@resp.parsed_response["msg"]).to eql "title must be unique"
            end
        end
    end

    context "Dado que o titulo nao existe" do
        before(:all) do
            @payload = @data["no_title"]
        end
        context "Quando faco o cadastro" do
            before(:all) do
                @resp = @product.create(@payload)
            end
            it 'Entao deve retornar 400' do
                expect(@resp.code).to eql 400
            end
            it 'E retorna a mensagem Oops! title cannot be empty' do
                expect(@resp.parsed_response["msg"]).to eql "Oops! title cannot be empty"
            end
        end
    end


    context "Dado que a categoria nao existe" do
        before(:all) do
            @payload = {
                title: "Alex Kid",
                category: "",
                producers: ["Sega"], 
                price: "19.99", 
                description: "Outro Game muito Legal",
                cover: "alex.jpg"
            }
        end

        context "Quando faco cadastro" do
            before(:all) do
                @resp = @product.create(@payload)
            end
            it 'Entao deve retornar 400' do
                expect(@resp.code).to eql 400
            end
            it 'E retorna a mensagem Oops! category cannot be empty' do
                expect(@resp.parsed_response["msg"]).to eql "Oops! category cannot be empty"
            end
        end
    end


    context "Dado que o preco nao foi informado" do
        before(:all) do
            @payload = {
                title: "Alex Kid",
                category: "Master System",
                producers: ["Sega"], 
                price: "", 
                description: "Outro Game muito Legal",
                cover: "alex.jpg"
            }
        end

        context "Quando eu criar um novo produto" do
            before(:all) do
                @resp = @product.create(@payload)
            end
            it 'Entao deve retornar 400' do
                expect(@resp.code).to eql 400
            end
            it 'E ver a mensagem Oops! price cannot be empty' do
                expect(@resp.parsed_response["msg"]).to eql "Oops! price cannot be empty"
            end
        end
    end
end