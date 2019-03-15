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

class PaymentInfo < ApplicationRecord
  belongs_to :user, :inverse_of => :payment_info

  validates :stripe_token, presence: true, uniqueness: true
end
