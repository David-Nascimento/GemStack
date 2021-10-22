describe "PUT /products/:id" do
    context "dado que eu tenha um produto" do
        before(:all) do
            #TODO falta implementar
            @product = Product.new("david@ninjapixel.com", "pwd123")
            @data = YAML.load_file(File.join(Dir.pwd, "spec/fixtures/post.yaml"))
        end
    
        context "quando eu atualizo", :doing do
            before do
                #TODO falta implementar
                @payload = @data["dup"]
                Database.new.remove_product(@payload["title"])
                resp = @product.create(@payload)
                @product_id = resp.parsed_response['id']
            end

            it "entao deve retornar 204" do
                resp = @product.updated(@product_id)
                expect(resp.code).to eql 204
            end
        end
    end
end