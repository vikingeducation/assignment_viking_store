class Address < ApplicationRecord
  belongs_to :type
  belongs_to :user
  belongs_to :state
end
