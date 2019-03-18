class ChoseJokeService
  def self.build(campaign_id)
    campaign = Campaign.find(campaign_id)
    self.new(campaign)
  end

  def initialize(campaign)
    @campaign = campaign
  end

  def call
    Rails.logger.info("- Start #{self.class.name}")



  rescue => e
    return ServiceResult.new(status: false, message: e.message)

  end
end
