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

class Victim < ApplicationRecord
  belongs_to :campaign, :inverse_of => :victim
  has_many :blocked_numbers, :dependent => :destroy

  validates :phone_number, :name , presence: true
end
