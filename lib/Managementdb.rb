require 'httparty'

class Managementdb
  include HTTParty

  # If you wanted a default, class-level base_uri, set it here:
  base_uri "http://games"

  def self.login(game_name)
    base_uri =
      case game_name
      when "game1" then "http://jmoshowcase.com"
      when "game2" then "http://game2"
      when "game3" then "http://game3"
      end

    # To override base_uri for an individual request, pass
    # it as an option:
    @response = get "/login", base_uri: base_uri
  end
end