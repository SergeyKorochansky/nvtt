require_relative './spec_helper'

describe 'Login' do
  it 'should return page' do
    get '/login'
    expect(last_response).to be_ok
    expect(last_response.body).to include 'Login'
  end

  it 'should redirect to profile page' do
    post '/login'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_request.url).to eq 'http://example.org/profile'
  end
end
