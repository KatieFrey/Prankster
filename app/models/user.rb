# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  credits    :integer
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_one :payment_info, :dependent => :destroy
  has_many :campaigns,:dependent => :destroy
  has_many :payment_transactions, :dependent => :destroy
  has_many :payment_refund_transactions, :through => :payment_transactions
  has_many :victims, :through => :campaigns

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
