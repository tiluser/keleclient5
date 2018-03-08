module Roadmap
    
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