require_relative './spec_helper'

describe 'Logout' do
  it 'should should redirect to login page' do
    post '/logout'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_request.url).to eq 'http://example.org/login'
  end
end
