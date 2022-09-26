class Order < ApplicationRecord
  belongs_to :product
  belongs_to :client
  has_many :products
end
