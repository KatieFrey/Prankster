# == Schema Information
#
# Table name: victim_replies
#
#  id          :bigint(8)        not null, primary key
#  reply       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :bigint(8)
#
# Indexes
#
#  index_victim_replies_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#

class VictimReply < ApplicationRecord
  belongs_to :campaign, :inverse_of => :victim_replies

  validates :reply, presence: true
end
