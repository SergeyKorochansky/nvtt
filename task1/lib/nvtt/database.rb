require 'json'
require 'fileutils'

module NVTT
  module Database
    DB_NAME = File.expand_path(File.dirname(__FILE__) + '/../../db/db.json')
    SEED_DB_NAME = File.expand_path(File.dirname(__FILE__) + '/../../db/db_seed.json')

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

    def self.seed
      FileUtils.cp(SEED_DB_NAME, DB_NAME)
    end
  end
end
