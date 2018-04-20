# Write your code here!
require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
        "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
        "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
        "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
        "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
      }
    },
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
        "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
        },
        "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
        "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
        "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
        },
      }
    }
  }
end

def num_points_scored (player_name)
  game_hash.each_key { |location|
    if game_hash[location][:players].include?(player_name)
      return game_hash[location][:players][player_name][:points]
    end
  }
end

def shoe_size (player_name)
  game_hash.each_key { |location|
    if game_hash[location][:players].include?(player_name)
      return game_hash[location][:players][player_name][:shoe]
    end
  }
end

def team_colors (team)
  game_hash.each_key { |location|
    if game_hash[location][:team_name].include?(team)
      return game_hash[location][:colors]
    end
  }
end

def team_names
  team_array = []
  game_hash.each_key { |location|
    team_array.push(game_hash[location][:team_name])
  }
  team_array
end

def player_numbers (team)
  team_numbers_array = []
  game_hash.each_key { |location|
    if game_hash[location][:team_name] == team
      for player in game_hash[location][:players].keys
        team_numbers_array.push(game_hash[location][:players][player][:number])
      end
      return team_numbers_array
    end
    puts "hello"
  }
  team_numbers_array
end

def player_stats(player_name)
  game_hash.each_key { |location|
    if game_hash[location][:players].include?(player_name)
      return game_hash[location][:players][player_name]
    end
  }
end

# grab the first player, and their shoe size into a variable 
# iterate through the players, and if a given player has a 
# larger shoe, replace that player as the biggest
# once the iteration ends, return the biggest shod player's rebound count

def big_shoe_rebounds
  big_shoes = []
  max_shoe = []
  what_team = []
  game_hash.each do |location, team_color_player|
    team_color_player.each do |tcp, players|
      if tcp == :players
        players.each do |player, stat|
          stat.each do |statistic, actual|
            if statistic == :shoe
              max_shoe.push(actual)
              if max_shoe.max == actual
                big_shoes.push(player)
                what_team.push(location)
              end
            end
          end
        end
      end
    end
  end
  return game_hash[what_team.last][:players][big_shoes.last][:rebounds]
end