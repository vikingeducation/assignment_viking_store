class CreditCardCompany < ApplicationRecord
  has_many :cards, :class_name => 'CreditCard', :foreign_key => 'company_id'
end
