Given(/^I have set a connection to application$/) do
  # pending # Write code here that turns the phrase above into concrete actions
  @http_connection = Rest_service.get_connection

end

When /^I send a (PUT|POST) request to (.*?) with json$/ do |method, end_point, json_text|
  http_request = Rest_service.get_request(method, end_point)
  http_request['content-type'] = 'application/json'
  http_request['accept'] = 'application/json'

  http_request.body = json_text
  @http_response = Rest_service.execute_request(@http_connection, http_request)
  @last_json = @http_response.body
end

When /^I send a (GET) request to "(.*?)"$/ do |method, end_point|
  http_request = Rest_service.get_request(method, end_point)
  # http_request['Authorization'] = Auth_app.make_base_auth
  puts http_request['Authorization']

  @http_response = Rest_service.execute_request(@http_connection, http_request)
  @last_json = @http_response.body
  $token = @last_json.to_json["TokenString"]
  puts $token
  puts @last_json
end

When /^I send a (GET) request with token to "(.*?)"$/ do |method, end_point|
  http_request = Rest_service.get_request(method, end_point)
  # http_request['Authorization'] = Auth_app.make_base_auth
  # http_request['token'] = $token
  # puts http_request['token']

  @http_response = Rest_service.execute_request(@http_connection, http_request)
  @last_json = @http_response.body
  puts @last_json
end

Then /^I expect HTTP code (\d+)$/ do |http_code|
  expect(@http_response.code).to eql(http_code)
end

Then /^I expect JSON equal to$/ do |json_text|
  expect(@last_json).to be_json_eql json_text
end
