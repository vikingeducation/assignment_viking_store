class CreditCard < ActiveRecord::Base
  belongs_to :user
  has_many :orders, dependent: :nullify

  def expiration
    "#{exp_month}/#{exp_year}"
  end

  def last_4_digits
    card_number[-4..-1]
  end
end
