class Order < ApplicationRecord
  belongs_to :consumer
  belongs_to :serviceprovider
  has_many :orderitems
end
