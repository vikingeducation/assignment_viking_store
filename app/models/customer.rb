class Customer < ApplicationRecord
  validates :credit_card, :phone_number, { presence: true }
  validates :user_id, 
end

# if User is logged_in || User inputs address
#   set check_out true
# else
#   throw an error
# end