module Twilio
  class SendTextService
    def self.build(to_number,from_number,message)
      self.new(to_number,from_number,message)
    end

    def initialize(to_number,from_number,message)
      @to_number = to_number
      @from_number = from_number
      @message = message
    end

    def call
      Rails.logger.info("- Start #{self.class.name}")

      client = Twilio::REST::Client.new
      response = client.messages.create(
        to: @to_number,
        from: @from_number,
        body: @message
      )

      Rails.logger.info("- Finish #{self.class.name}")
      ServiceResult.new(status: true)

    rescue => e
      return ServiceResult.new(status: false, message: e.message)

    end
  end
end
