module Seed
  class CartmanJokesService
    def self.build
      self.new
    end

    def initialize
    end

    def call
      Rails.logger.info("- Start #{self.class.name}")

      jokes = [
        {:joke_type => 1, :sequence => 1, :uuid => 101,
          :joke => "How come everything today has involved things either coming in or going out of my ass?"
        },
        {:joke_type => 1, :sequence => 2, :uuid => 102,
          :joke => "It's a man's obligation to stick his boneration in a woman's separation, this sort of penetration will increase the population of the younger generation."
        },
        {:joke_type => 1, :sequence => 3, :uuid => 103,
          :joke => "Hippies. They're everywhere. They wanna save the earth, but all they do is smoke pot and smell bad."
        },
        {:joke_type => 1, :sequence => 4, :uuid => 104,
          :joke => "I've learned something, too: selling out is sweet because when you sell out, you get to make a lot of money, and when you have money, you dont have to hang out with a bunch of poor asses like you guys. Screw you guys, I'm going home."
        },
        {:joke_type => 1, :sequence => 5, :uuid => 105,
          :joke => "I'm not just sure, I'm HIV positive."

        },
        {:joke_type => 1, :sequence => 6, :uuid => 106,
          :joke => "Handle it? For two billion dollars I could handle my Grandpas balls dude."
        },
        {:joke_type => 1, :sequence => 7, :uuid => 107,
          :joke => "Well, I've been lickin this carpet for 3 whole hours and I dont feel like a lesbian."
        },
        {:joke_type => 1, :sequence => 8, :uuid => 108,
          :joke => "Dolphins, Eskimos, who cares? It's all a bunch of tree-hugging hippie crap."
        },
        {:joke_type => 1, :sequence => 9, :uuid => 109,
          :joke => "Your breaking my balls man, your breaking my balls!"
        },
        {:joke_type => 1, :sequence => 10, :uuid => 110,
          :joke => "Nyahnyahnyahnyah nyah nyah! I made you eat your parents!"
        },
        {:joke_type => 1, :sequence => 11, :uuid => 111,
          :joke => "I would never let a woman kick my ass. If she tried something, I'd be like, HEY! You get your bitch ass back in the kitchen and make me some pie!"
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
      return ServiceResult.new(status: true)
    end
  end
end
