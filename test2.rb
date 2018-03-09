equire 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'

values = {
    "assignment_branch":"assignment-22-iterative-search",
    "assignment_commit_link":"https":/github.com/me/repo/commit/5",
    "checkpoint_id":1635,
    "comment":"this is my work",
    "enrollment_id":11218,
}

headers = {
  :content_type => 'application/json',
  :authorization => 'eyJ0eXAiOiJKV1QiLCJhhGciOiJIUzI1NiJ9.eyJhcGlfa2V5IjoiYTc2MDZkNTBhYjA3NDE4ZWE4ZmU5NzliY2YxNTM1ZjAiLCJ1c2VyX2lkIjoyMzAzMTExLCJuYW1lIjoiQmVuIE5lZWx5In0.3VXD-FxOoxaGXHu6vmL8g191bl5F_oKe9qj8Khmp9F0'
}

response = RestClient.put 'https://www.bloc.io/api/v1/checkpoint_submissions/:id', values, headers
puts response