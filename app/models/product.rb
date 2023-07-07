class Product < ApplicationRecord
  validates_presence_of :title, :description, :category_id

  has_many :line_items, dependent: :destroy
end