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

require 'rails_helper'

RSpec.describe PlatformPhoneNumber, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:blocked_numbers).dependent(:destroy) }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:provider)}

    it {
      is_expected.to define_enum_for(:provider).with_values(twilio: 0, nexmo: 1)
    }
  end
end
