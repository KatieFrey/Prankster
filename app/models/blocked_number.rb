# == Schema Information
#
# Table name: blocked_numbers
#
#  id                     :bigint(8)        not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  twilio_phone_number_id :bigint(8)
#  victim_id              :bigint(8)
#
# Indexes
#
#  index_blocked_numbers_on_twilio_phone_number_id  (twilio_phone_number_id)
#  index_blocked_numbers_on_victim_id               (victim_id)
#
# Foreign Keys
#
#  fk_rails_...  (twilio_phone_number_id => twilio_phone_numbers.id)
#  fk_rails_...  (victim_id => victims.id)
#

class BlockedNumber < ApplicationRecord
  belongs_to :twilio_phone_number, :inverse_of => :blocked_numbers
  belongs_to :victim, :inverse_of => :blocked_numbers
end
