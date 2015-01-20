require_relative './spec_helper'

describe 'Login' do

  it 'should return page' do
    get '/login'
    expect(last_response.status).to eq 200
    expect(last_response.body).to include 'Login'
  end
end