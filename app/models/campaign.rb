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

class Campaign < ApplicationRecord

  belongs_to :user, :inverse_of => :campaigns
  has_one :victim, :dependent => :destroy
  has_many :victim_replies, :dependent => :destroy
  has_many :ai_messages, :dependent => :destroy
  has_many :used_jokes, :dependent => :destroy
  has_many :all_jokes, through: :used_jokes

  validates :number_of_jokes, :duration, :campaign_type, presence: true
  validates :duration, numericality: { less_than_or_equal_to: 360, greater_than_or_equal_to: 30 }

  validates_inclusion_of :number_of_jokes, :in => Constants::NUMBER_OF_POSSIBLE_JOKES

  enum campaign_type: {chuck_norris: 0, cartman: 1, trump: 2, monty_python: 3}
end
