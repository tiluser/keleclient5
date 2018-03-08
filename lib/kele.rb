require 'httparty'
require 'pp'
require 'json'

class Kele
    include HTTParty
    base_uri "https://www.bloc.io/api/v1"
    
    def initialize(u, p)
        
        info = {
            body: {
                username: u,
                password: p,
                email: u
            }
        }
        @sessions_url = self.class.base_uri + "/sessions"
        @response = self.class.post(@sessions_url, info)
        @auth_token = @response.parsed_response['auth_token']
        if @auth_token == nil
            puts "Error: invalid credentials"
        end
    end
    
    def show_auth
        pp @auth_token
    end
    
    def get_me
        url = self.class.base_uri + "/users/me"
        response = self.class.get(url, headers: { "Authorization" => @auth_token })
        JSON.parse response.body
    end
    
    def self.shorten(website_url)
       post('/api/links.json', query: { link: { website_url: website_url } })
    end

end