require "pg"

class Database

    # conexao com o Banco de dados PGDB
    def conn
        conn_hash = { host: "pgdb", dbname: "ninjapixel", user: "postgres", password: "qaninja" }
        conn = PG.connect(conn_hash)
    end

    def delete_product(name)
        conn.exec("delete from public.products where title = '#{name}';")
    end

    def insert_product(product)
        # todo
        query = "INSERT INTO public.products (title, description, category, price, created_at, updated_at)
        values ('Alex Kid', 'Outro clássico muito legal', 'Master System', 29.99, current_timestamp, current_timestamp);"
    
        conn.exec(query)
    end

end