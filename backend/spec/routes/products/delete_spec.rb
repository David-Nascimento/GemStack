describe 'DELETE /products:id ' do
    before(:all) do
        @product = Product.new('david@ninjapixel.com', 'pwd123')
        @data = YAML.load_file(File.join(Dir.pwd, 'spec/fixtures/delete.yaml'))
    end
    describe '/products/:id' do
        context 'dado que eu tenha um produto' do
            before(:all) do
                @payload = @data['mario']
                Database.new.remove_product(@payload['mario'])
                resp = @product.create(@payload)
                @product_id = resp.parsed_response['id']
            end

            context 'quando busco por Id' do
            before(:all) do
                @resp = @product.remove(@product_id)
            end

            it 'entao deve retornar 204' do
                expect(@resp.code).to eql 204
            end
        end

        after(:all) do
            resp = @product.unique(@product_id)
            expect(resp.code).to eql 404
        end
    end
end
end