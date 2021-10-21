require "pg"

class Database

    # conexao com o Banco de dados PGDB
    def conn
        conn_hash = {host: "pgdb", dbname: "ninjapixel", user: "postgres", password: "qaninja"}
        conn = PG.connect(conn_hash)
    end

    def remove_product(name)
        conn.exec("delete from public.products where title = '#{name}';")
    end

end