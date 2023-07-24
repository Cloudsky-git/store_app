class Product < ApplicationRecord
  validates_presence_of :title, :description, :category_id

  belongs_to :category

  has_many :line_items, dependent: :destroy
end