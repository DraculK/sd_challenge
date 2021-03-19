class Book < ApplicationRecord
    validates :title, :author, :year, :description, :category, presence: true
    belongs_to :category
    has_one_attached :image
    has_one_attached :file
    validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
