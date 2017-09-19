crumb :root do
  link 'Home', pedidos_path
end

crumb :produtos do
  link 'Produtos', produtos_path
end

crumb :clientes do
  link 'Clientes', clientes_path
end

crumb :cliente do |cliente|
  link cliente.nome, cliente
  parent :clientes
end

crumb :new_cliente do
  link 'Novo Cliente', new_cliente_path
  parent :clientes
end

crumb :produto do |produto|
  link produto.descricao, produto
  parent :produtos
end

crumb :new_produto do
  link 'Novo produto', new_produto_path
  parent :produtos
end

crumb :pedido do |pedido|
  link pedido.id, pedido
  parent :root
end

crumb :new_pedido do
  parent :root
  link 'Novo pedido', new_pedido_path
  parent :root
end
# crumb :projects
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
