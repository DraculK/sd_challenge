class Book < ApplicationRecord
    validates :title, :author, :year, :description, :category, presence: true
    belongs_to :category
end
