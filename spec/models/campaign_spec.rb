# == Schema Information
#
# Table name: campaigns
#
#  id              :bigint(8)        not null, primary key
#  campaign_type   :integer
#  done            :boolean          default(FALSE)
#  duration        :integer
#  number_of_jokes :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint(8)
#
# Indexes
#
#  index_campaigns_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user).inverse_of(:campaigns) }
    it { is_expected.to have_one(:victim).dependent(:destroy) }
    it { is_expected.to have_many(:victim_replies).dependent(:destroy) }
    it { is_expected.to have_many(:ai_messages).dependent(:destroy) }
    it { is_expected.to have_many(:used_jokes).dependent(:destroy) }
  end

  describe "validations" do
    it {
      is_expected.to(
        validate_numericality_of(:duration).
        is_greater_than_or_equal_to(30).
        is_less_than_or_equal_to(360)
      )
    }

    it {
      is_expected.to define_enum_for(:campaign_type).with_values(chuck_norris: 0, cartman: 1, trump: 2, monty_python: 3)
    }

    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:number_of_jokes) }
    it { is_expected.to validate_presence_of(:campaign_type) }


    it { is_expected.to validate_inclusion_of(:number_of_jokes).in_array(Constants::NUMBER_OF_POSSIBLE_JOKES) }
  end
end
