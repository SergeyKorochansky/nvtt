require 'rspec'

describe 'Profile' do

  it 'should return page' do
    get '/profile'
    expect(last_response).to be_ok
    expect(last_response.body).to include 'Profile'
  end
end