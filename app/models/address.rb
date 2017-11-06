class Address < ApplicationRecord
  belongs_to :user

  enum type: [:shipping, :billing]
end
