# == Schema Information
#
# Table name: all_jokes
#
#  id         :bigint(8)        not null, primary key
#  joke       :string
#  joke_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AllJoke < ApplicationRecord
  has_many :used_jokes, :dependent => :destroy

  validates :joke, :joke_type, presence: true
end
