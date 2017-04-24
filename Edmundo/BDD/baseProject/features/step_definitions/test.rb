Given(/^I have set a connection to application$/) do
  # pending # Write code here that turns the phrase above into concrete actions
  @http_connection = Rest_service.get_connection

end

When /^I send a (PUT|POST) request to (.*?) with json$/ do |method, end_point, json_text|
  http_request = Rest_service.get_request(method, end_point)
  http_request.body = json_text
  @http_response = Rest_service.execute_request(@http_connection, http_request)
  @last_json = @http_response.body
end

When /^I send a (GET) request to "(.*?)"$/ do |method, end_point|
  http_request = Rest_service.get_request(method, end_point)
  @http_response = Rest_service.execute_request(@http_connection, http_request)
  @last_json = @http_response.body
end

Then /^I expect HTTP code (\d+)$/ do |http_code|
  expect(@http_response.code).to eql(http_code)
end
