require 'httparty'
require 'pp'
require 'json'
require './lib/roadmap'

class Kele
    include HTTParty
    include Roadmap
    
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
    
    def get_mentor_availability(mentor_id)
        url = self.class.base_uri + "/mentors/" + mentor_id.to_s + "/student_availability"
        response = self.class.get(url, headers: { "Authorization" => @auth_token })
        JSON.parse response.body
    end
    
    def get_roadmap(roadmap_id)
        url = self.class.base_uri + "/roadmaps/" + roadmap_id.to_s
        response = self.class.get(url, headers: { "Authorization" => @auth_token })
        JSON.parse response.body
    end
    
    def get_checkpoint(checkpoint_id)
        url = self.class.base_uri + "/checkpoints/" + checkpoint_id.to_s
        response = self.class.get(url, headers: { "Authorization" => @auth_token })
        JSON.parse response.body
    end


end