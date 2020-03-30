class Consumer < ApplicationRecord
  # add validations here
  #  has_and_belongs_to_many :teachers
  has_many :orders
  has_many :serviceproviders , :through => :orders

end
