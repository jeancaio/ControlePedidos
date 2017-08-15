json.extract! produto, :id, :descricao, :preco, :ativo, :estoque, :created_at, :updated_at
json.url produto_url(produto, format: :json)
