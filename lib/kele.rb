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
    
    def get_messages(*args)
        url = self.class.base_uri + "/message_threads"
        response = self.class.get(url, headers: { "Authorization" => @auth_token })
        body = JSON.parse response.body 
        messages = body["items"]
        if args[0] == nil
            messages
        else
            message_id = args[0]
            messages[message_id]
        end
    end
    
    def create_message(sender, recipient_id, token, subject, text)
        url = self.class.base_uri + "/message"
        info = {
            body: {
                "sender": sender,
                "recipient_id": recipient_id,
                "token": token,  
                "subject": subject,
                "stripped-text": text
            }
        }
    
        response = self.class.post(url, info)
        
    end
    
    def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
        url = self.class.base_uri + "/checkpoint_submissions"
        gm_info = get_me
        
        info = {
            body: { 
                "assignment_branch": assignment_branch,
                "assignment_commit_link": assignment_commit_link,
                "checkpoint_id": checkpoint_id,  
                "comment": comment,
                "enrollment_id": ["id"]
            }
        }
    
        response = self.class.post(url, info)
        
    end
    
end