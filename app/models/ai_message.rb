# == Schema Information
#
# Table name: ai_messages
#
#  id          :bigint(8)        not null, primary key
#  message     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :bigint(8)
#
# Indexes
#
#  index_ai_messages_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#

class AiMessage < ApplicationRecord
  belongs_to :campaign, :inverse_of => :ai_messages

  validates :message, presence: true
end
