require "pg"

class Database

    # conexao com o Banco de dados PGDB
    def delete_product(name)
        conn_hash = {host: "pgdb", dbname: "ninjapixel", user: "postgres", password: "qaninja"}
        conn = PG.connect(conn_hash)
        
        conn.exec("delete from public.products where title = '#{name}';")
    end

end