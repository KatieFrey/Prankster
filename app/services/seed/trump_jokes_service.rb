module Seed
  class TrumpJokesService
    def self.build
      self.new
    end

    def initialize
    end

    def call
      Rails.logger.info("- Start #{self.class.name}")

      jokes = [
        {:joke_type => 2, :sequence => 1, :uuid => 201,
          :joke => "If horses are measured in hands, Donald Trump must have the biggest horses in the world.."
        },
        {:joke_type => 2, :sequence => 2, :uuid => 202,
          :joke => "Trump hates the first amendment, loves the second amendment, and has no idea what the third amendment is."
        },
        {:joke_type => 2, :sequence => 3, :uuid => 203,
          :joke => "People say Trump is a Putin puppet, a Manchurian candidate, but Trump is so stupid that his subconscious has probably forgotten the trigger phrase."
        },
        {:joke_type => 2, :sequence => 4, :uuid => 204,
          :joke => "The humane society will give Donald Trump $5 if he releases that think on his head back into the woods."
        },
        {:joke_type => 2, :sequence => 5, :uuid => 205,
          :joke => "Basically, Trump is what would happen if the comments section became human and ran for president."

        },
        {:joke_type => 2, :sequence => 6, :uuid => 206,
          :joke => "Donald Trump is so priveleged that the first ob he ever had to apply for was President of the United States."
        },
        {:joke_type => 2, :sequence => 7, :uuid => 207,
          :joke => "That awkward moment when Trump supporters finally realize Trump played them all for suckers . . ."
        },
        {:joke_type => 2, :sequence => 8, :uuid => 208,
          :joke => "Donald Trump walked into the White House. There's no punchline. Ruining America isn't funny."
        },
        {:joke_type => 2, :sequence => 9, :uuid => 209,
          :joke => "Trump’s nothing like Hitler. There’s no way he could write a book."
        },
        {:joke_type => 2, :sequence => 10, :uuid => 210,
          :joke => "Trump's core demographic is men whose holiday destinations significantly overlap with a list of missing women."
        },
        {:joke_type => 2, :sequence => 11, :uuid => 211,
          :joke => "Trump was delighted to hear that Mexico was finally building a wall. Unfortunately, Trump doesn't really understand the World Cup."
        }
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
