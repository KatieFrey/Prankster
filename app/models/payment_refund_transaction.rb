# == Schema Information
#
# Table name: payment_refund_transactions
#
#  id                     :bigint(8)        not null, primary key
#  amount                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  payment_transaction_id :bigint(8)
#  stripe_refund_id       :string
#
# Indexes
#
#  index_payment_refund_transactions_on_payment_transaction_id  (payment_transaction_id)
#
# Foreign Keys
#
#  fk_rails_...  (payment_transaction_id => payment_transactions.id)
#

class PaymentRefundTransaction < ApplicationRecord
  belongs_to :payment_transaction, :inverse_of => :payment_refund_transactions

  validates :stripe_refund_id, presence: true, uniqueness: true
  validates :amount, presence: true
  validates :amount, numericality: true
end
