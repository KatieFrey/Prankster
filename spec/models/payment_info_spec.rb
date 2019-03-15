# == Schema Information
#
# Table name: payment_infos
#
#  id               :bigint(8)        not null, primary key
#  card_type        :string
#  last_four_digits :string
#  stripe_token     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint(8)
#
# Indexes
#
#  index_payment_infos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe PaymentInfo, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user).inverse_of(:payment_info) }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:stripe_token) }
    it { is_expected.to validate_uniqueness_of(:stripe_token) }
  end
end
