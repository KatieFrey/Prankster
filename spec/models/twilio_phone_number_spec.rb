# == Schema Information
#
# Table name: twilio_phone_numbers
#
#  id           :bigint(8)        not null, primary key
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe TwilioPhoneNumber, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:blocked_numbers).dependent(:destroy) }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:phone_number) }
  end
end
