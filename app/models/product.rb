class Product < ApplicationRecord
  validates_presence_of :title, :description, :category_id
end