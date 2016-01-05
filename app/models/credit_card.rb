class CreditCard < ActiveRecord::Base
  belongs_to :user
  has_many :orders, dependent: :nullify

  validates :card_number, length: {is: 16}

  def expiration
    "#{exp_month}/#{exp_year}"
  end

  def last_4_digits
    card_number[-4..-1]
  end

  def short_description
    "#{nickname}: #{brand.upcase} ****#{last_4_digits}"
  end
end
