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

require 'rails_helper'

RSpec.describe PaymentTransaction, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user).inverse_of(:payment_transactions) }
    it { is_expected.to have_many(:payment_refund_transactions).dependent(:destroy) }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:stripe_transaction_id) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_uniqueness_of(:stripe_transaction_id) }
    it {
      is_expected.to(
        validate_numericality_of(:amount)
      )
    }
  end
end
