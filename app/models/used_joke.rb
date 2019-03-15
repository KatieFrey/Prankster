# == Schema Information
#
# Table name: used_jokes
#
#  id          :bigint(8)        not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  all_joke_id :bigint(8)
#  campaign_id :bigint(8)
#
# Indexes
#
#  index_used_jokes_on_all_joke_id  (all_joke_id)
#  index_used_jokes_on_campaign_id  (campaign_id)
#
# Foreign Keys
#
#  fk_rails_...  (all_joke_id => all_jokes.id)
#  fk_rails_...  (campaign_id => campaigns.id)
#

class UsedJoke < ApplicationRecord
  belongs_to :all_joke, :inverse_of => :used_jokes
  belongs_to :campaign, :inverse_of => :used_jokes
end
