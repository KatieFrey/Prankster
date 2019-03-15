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

require 'rails_helper'

RSpec.describe PaymentRefundTransaction, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:payment_transaction).inverse_of(:payment_refund_transactions) }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:stripe_refund_id) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_uniqueness_of(:stripe_refund_id) }
    it {
      is_expected.to(
        validate_numericality_of(:amount)
      )
    }
  end
end
