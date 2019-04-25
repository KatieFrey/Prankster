class ChooseJokeService
  def self.build(campaign_id)
    campaign = Campaign.find(campaign_id)
    self.new(campaign)#making a new instance of class ChoseJokeService. When .new is called, initialize method is called |
            # V
  end

  def initialize(campaign)
    @campaign = campaign#instance variable gets created
  end

  def call
    Rails.logger.info("- Start #{self.class.name}")

    if (@campaign.used_jokes.count < @campaign.number_of_jokes)
      #On todo list: Figure out what joke to send
      # joke = assigned joke
      if (@campaign.used_jokes.empty?)
        sequence = 1
      else
        sequence = @campaign.all_jokes.order("sequence DESC").first.sequence + 1
      end

      joke = AllJoke.where(:joke_type => @campaign.campaign_type, :sequence => sequence).first

      #Send joke to victim

      #Add Joke to Used Joke

      return ServiceResult.new(status: true, message: 'joke chosen', data: joke)

    else
      return ServiceResult.new(status: true, message: 'All jokes have been sent.')

      @campaign.done = true
      @campaign.save
    end

  rescue => e
    return ServiceResult.new(status: false, message: e.message)

  end
end
