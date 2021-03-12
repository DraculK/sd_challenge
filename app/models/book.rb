class Book < ApplicationRecord
    validates :title, :author, :year, :description, presence: true
end
