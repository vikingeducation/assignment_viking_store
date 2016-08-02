class User < ApplicationRecord
  belongs_to :default_shipping
  belongs_to :default_billing
end
