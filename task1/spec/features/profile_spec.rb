require_relative '../spec_helper'

describe 'Profile' do

  context 'for not logged in user' do
    before { visit '/profile' }

    it 'redirects to login page' do
      expect(current_path).to eq '/login'
    end
    it 'contains error message'  do
      expect(page).to have_content 'You must be logged in'
    end
  end

  context 'for logged in user' do
    before do
      login(name: 'john', password: '000')
      visit '/profile'
    end

    it 'contains greeting' do
      expect(page).to have_content 'Your profile'
    end

    it 'contains logout button' do
      expect(page).to have_button 'Log out'
    end
  end
end