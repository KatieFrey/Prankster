# == Schema Information
#
# Table name: twilio_phone_numbers
#
#  id           :bigint(8)        not null, primary key
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TwilioPhoneNumber < ApplicationRecord
  has_many :blocked_numbers, :dependent => :destroy

  validates :phone_number, presence: true
end
