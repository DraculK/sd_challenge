class Book < ApplicationRecord
    validates :title, :author, :year, :description, :category, presence: true
    belongs_to :category
    has_one_attached :image
end
