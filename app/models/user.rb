class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :billing_address, :class_name => 'Address'
  has_one :shipping_address, :class_name => 'Address'
  has_many :addresses, dependent: :destroy

  has_many :orders
  has_one :cart

end
