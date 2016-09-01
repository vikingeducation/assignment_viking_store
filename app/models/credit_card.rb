class CreditCard < ApplicationRecord
  belongs_to :profile
  belongs_to :company, :class_name => 'CreditCardCompany'
end
