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

class AllJoke < ApplicationRecord
  has_many :used_jokes, :dependent => :destroy

  validates :joke, :joke_type, :uuid, :sequence, presence: true
  validates :sequence, :uuid, numericality: true
  validates :uuid, uniqueness: true
  validates_uniqueness_of :sequence, scope: :joke_type

  # scope :cartman_jokes, -> {where(joke_type: 1)}
  # scope :chuck_norris_jokes, -> {where(joke_type: 0)}

  enum joke_type: {chuck_norris: 0, cartman: 1, trump: 2, monty_python: 3}
end
