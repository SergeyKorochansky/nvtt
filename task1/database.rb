require 'json'

class Database
  DB_NAME = 'db/db.json'

  def self.find(name)
    users = JSON.parse(File.open(DB_NAME, 'r').read, symbolize_names: true)
    user_index = users.find_index { |u| u[:name] == name }
    OpenStruct.new(users[user_index]) if user_index
  end

  def self.save(user)
    users = JSON.parse(File.open(DB_NAME, 'r').read, symbolize_names: true)
    user_index = users.find_index { |u| u[:name] == user[:name] }

    if user_index
      users[user_index] = user.to_h
      File.open(DB_NAME, 'w') do |f|
        f.write(users.to_json)
      end
    end
  end
end