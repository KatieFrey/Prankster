# == Schema Information
#
# Table name: payment_transactions
#
#  id                    :bigint(8)        not null, primary key
#  amount                :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  stripe_transaction_id :string
#  user_id               :bigint(8)
#
# Indexes
#
#  index_payment_transactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class PaymentTransaction < ApplicationRecord
  belongs_to :user, :inverse_of => :payment_transactions
  has_many :payment_refund_transactions, :dependent => :destroy

  validates :stripe_transaction_id, presence: true, uniqueness: true
  validates :amount, presence: true
  validates :amount, numericality: true
end
