# == Schema Information
#
# Table name: platform_phone_numbers
#
#  id           :bigint(8)        not null, primary key
#  phone_number :string
#  provider     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PlatformPhoneNumber < ApplicationRecord
  has_many :blocked_numbers, :dependent => :destroy

  validates :phone_number, :provider, presence: true

  enum provider: {twilio: 0, nexmo: 1}


end
