FactoryBot.define do
  factory :user do
    email { "oi@oi.com" }
    name { "Oi" }
    admin { false }
    registration { "1234" }
    password {"oi1234"}
  end
end
