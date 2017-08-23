FactoryGirl.define do
  factory :usuario, class: Usuario do
    sequence(:email) {|n| "usuario#{n}@wonder.com.br"}
    password "web12345"
    password_confirmation "web12345"
  end
end
