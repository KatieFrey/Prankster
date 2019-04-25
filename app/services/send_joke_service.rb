class SendJokeService
  def self.build(campaign_id)
    campaign = Campaign.find(campaign_id)
    self.new(campaign)
  end

  def initialize(campaign)
    @campaign = campaign
  end

  def call
    choose_service = ChooseJokeService.build(@campaign.id).call
    return choose_service if choose_service.failure?

    joke = choose_service.data
    message = joke.joke
    from_number = PlatformPhoneNumber.first.phone_number
    to_number = @campaign.victim.phone_number

    send_service = Twilio::SendTextService.build(to_number,from_number, message).call

    return send_service if send_service.failure?

    UsedJoke.create(:campaign_id => @campaign.id, :all_joke_id => joke.id)

    return ServiceResult.new(:message => 'Joke sent!', :status => true)

  rescue => e
    return ServiceResult.new(status: false, message: e.message)

  end
end
