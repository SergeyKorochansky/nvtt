require_relative '../spec_helper'

describe 'Login' do

  context 'with valid credentials' do
    before { login(name: 'john', password: '000') }

    it 'redirects to profile page' do
      expect(current_path).to eq '/profile'
    end

    it 'contains greeting' do
      expect(page).to have_content 'Hello, john!'
    end
  end

  context 'with invalid name' do
    before { login(name: 'mary', password: '000') }

    it 'redirects to login page' do
      expect(current_path).to eq '/login'
    end

    it 'contains error message' do
      expect(page).to have_content 'User mary does not exist'
    end
  end

  context 'with invalid password' do
    before { login(name: 'john', password: '111') }

    it 'redirects to login page' do
      expect(current_path).to eq '/login'
    end

    it 'contains error message' do
      expect(page).to have_content 'Incorrect credentials'
    end
  end

  context 'after 3 unsuccessful tries' do
    before { 3.times { login(name: 'john', password: '111') } }

    it 'redirects to login page' do
      expect(current_path).to eq '/login'
    end

    it 'contains error message' do
      expect(page).to have_content /Try again after \d+ seconds/
    end
  end
end