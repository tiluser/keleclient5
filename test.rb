require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'

values = {
    "assignment_branch":"checkpoint7",
    "assignment_commit_link":"https://github.com/tiluser/keleclient5/tree/checkpoint7",
    "checkpoint_id": 2162,
    "comment": "this is my work 2",
    "enrollment_id": 38753,
}

headers = {
  :content_type => 'application/json',
  :authorization => 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhcGlfa2V5IjoiYWVhNDJjYjY0ZWRjNDU0N2FiZTdkMDRmOWE1ZGY2NDgiLCJ1c2VyX2lkIjoyMzg0NjU3LCJuYW1lIjoiSm9zZXBoIE8nQ29ubm9yIn0.B0nVxtNB4KqDMAk9686skceYqmgrCLwK4ePD1G5HD3g'
}

response = RestClient.post 'https://www.bloc.io/api/v1/checkpoint_submissions', values, headers
puts response