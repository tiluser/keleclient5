require 'httparty'
require 'pp'

class Kele
    
    include HTTParty
    def initialize(u, p)
        @client = { username: u, password: p }
        @base_url = "https://www.bloc.io/api/v1"
        
        info = {
            body: {
                username: u,
                password: p,
                email: u
            }
        }
        
        pp self.class.post(@base_url + '/sessions', info)
    end

end