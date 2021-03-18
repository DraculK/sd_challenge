FactoryBot.define do
  factory :book do
    title { "Cálculo 1" }
    author { "Calculador" }
    year { 1995 }
    description { "Nada mais do que um livro de cálculo 1." }
    category.name {"teste"}
  end
end
