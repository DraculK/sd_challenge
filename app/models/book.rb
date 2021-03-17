class Book < ApplicationRecord
    validates :title, :author, :year, :description, presence: true
    belongs_to :category
end
