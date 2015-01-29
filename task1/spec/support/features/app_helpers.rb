module Features
  module AppHelpers
    def login(name:, password:)
      visit '/login'
      fill_in 'name', with: name
      fill_in 'password', with: password
      click_button 'Log in'
    end

    def logout
      visit '/profile'
      click_button 'Log out'
    end
  end
end