# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  credits    :integer          default(0)
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { is_expected.to have_one(:payment_info).dependent(:destroy) }
    it { is_expected.to have_many(:campaigns).dependent(:destroy) }
    it { is_expected.to have_many(:payment_transactions).dependent(:destroy) }
    it { is_expected.to have_many(:payment_refund_transactions).through(:payment_transactions) }
    it { is_expected.to have_many(:victims).through(:campaigns) }
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
