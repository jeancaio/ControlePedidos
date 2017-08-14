json.extract! cliente, :id, :nome, :cpf, :endereco, :cidade, :uf, :fone, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
