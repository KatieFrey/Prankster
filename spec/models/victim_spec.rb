# == Schema Information
#
# Table name: victims
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  campaign_id  :bigint(8)
#
# Indexes
#
#  index_victims_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#

require 'rails_helper'

RSpec.describe Victim, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:campaign).inverse_of(:victim) }
    it { is_expected.to have_many(:blocked_numbers).dependent(:destroy) }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
