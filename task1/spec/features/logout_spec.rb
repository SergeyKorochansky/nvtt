require_relative '../spec_helper'

describe 'Logout' do

  before do
    login(name: 'john', password: '000')
    logout
  end

  it 'redirects to login page' do
    expect(current_path).to eq '/login'
  end
end