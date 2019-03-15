# == Schema Information
#
# Table name: all_jokes
#
#  id         :bigint(8)        not null, primary key
#  joke       :string
#  joke_type  :integer
#  sequence   :integer
#  uuid       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe AllJoke, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:used_jokes).dependent(:destroy) }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:joke) }
    it { is_expected.to validate_presence_of(:joke_type) }
    it { is_expected.to validate_presence_of(:sequence) }
    it { is_expected.to validate_presence_of(:uuid) }
    it {
      is_expected.to(
        validate_numericality_of(:sequence)
      )
    }
    it {
      is_expected.to(
        validate_numericality_of(:uuid)
      )
    }
  end
end
