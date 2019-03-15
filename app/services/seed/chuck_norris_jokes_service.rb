module Seed
  class ChuckNorrisJokesService
    def self.build
      self.new
    end

    def initialize
    end

    def call
      Rails.logger.info("- Start #{self.class.name}")

      jokes = [
        {:joke_type => 0, :sequence => 1, :uuid => 1,
          :joke => "The First rule of Chuck Norris is: you do not talk about Chuck Norris."},
        {:joke_type => 0, :sequence => 2, :uuid => 2,
          :joke => "The Second rule of Chuck Norris is: you do not talk about Chuck Norris."},
        {:joke_type => 0, :sequence => 3, :uuid => 3,
          :joke => "The Last rule of Chuck Norris is: you do not talk about Chuck Norris."},
        {:joke_type => 0, :sequence => 4, :uuid => 4,
          :joke => "Chuck Norris counted to infinity... Twice."},
        {:joke_type => 0, :sequence => 5, :uuid => 5,
          :joke => "And that's why Chuck Norris can divide by zero."},
        {:joke_type => 0, :sequence => 6, :uuid => 6,
          :joke => "However, if you divide Chuck Norris by zero and you will in fact get one........one bad-ass that is."},
        {:joke_type => 0, :sequence => 7, :uuid => 7,
          :joke => "Chuck Norris has already been to Mars; that's why there are no signs of life there."},
        {:joke_type => 0, :sequence => 8, :uuid => 8,
          :joke => "Chuck Norris has also been to Pluto, that's why it is not a planet anymore."},
        {:joke_type => 0, :sequence => 9, :uuid => 9,
          :joke => "Chuck Norris knows the last digit of pi.."},
        {:joke_type => 0, :sequence => 10, :uuid => 10,
          :joke => "When Chuck Norris wants an egg, he cracks open a chicken."},
        {:joke_type => 0, :sequence => 11, :uuid => 11,
          :joke => "Chuck Norris once round-house kicked a salesman. Over the phone."},
        {:joke_type => 0, :sequence => 12, :uuid => 12,
          :joke => "Chuck Norris can remember the future."},
        {:joke_type => 0, :sequence => 13, :uuid => 13,
          :joke => "Chuck Norris doesn't age, because time cannot keep up with him."},
        {:joke_type => 0, :sequence => 14, :uuid => 14,
          :joke => "Chuck Norris can make onions cry."},
        {:joke_type => 0, :sequence => 15, :uuid => 15,
          :joke => "Chuck Norris can watch the radio."},
        {:joke_type => 0, :sequence => 16, :uuid => 16,
          :joke => "Chuck Norris knows Victoria's secret."},
      ]

      jokes.each do |j|
        joke = AllJoke.find_or_initialize_by(:uuid => j[:uuid])
        joke.sequence = j[:sequence]
        joke.joke = j[:joke]
        joke.joke_type = j[:joke_type]
        joke.save
      end


      Rails.logger.info("- Finish #{self.class.name}")
      ServiceResult.new(status: true)
    end
  end
end
