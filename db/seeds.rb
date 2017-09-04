
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Produto.count < 15
  50.times do
    p = Produto.new(
      descricao: FFaker::Product.product_name,
      preco: FFaker::AddressBR.building_number,
      ativo: FFaker::Boolean.random,
      estoque: FFaker::AddressBR.building_number,
      image_file_name: FFaker::Avatar.image
    )
    p.save
  end
end

if Cliente.count < 15
  50.times do
    c = Cliente.new(
      nome: FFaker::NameBR.name,
      cpf: FFaker::IdentificationBR.cpf,
      endereco: FFaker::AddressBR.street,
      cidade: FFaker::AddressBR.city,
      uf: FFaker::AddressBR.state_abbr,
      fone: FFaker::PhoneNumberBR.mobile_phone_number
    )
    c.save
  end
end
