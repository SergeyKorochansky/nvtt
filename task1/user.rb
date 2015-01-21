require 'digest'
require 'forwardable'
require_relative 'database'

module NVTT
  class User
    extend Forwardable
    def_delegators :@db_data, :name, :digest, :salt, :unsuccessful_tries,
                   :last_incorrect_login_try_at, :name=, :digest=,
                   :unsuccessful_tries=, :last_incorrect_login_try_at=
    attr_reader :password

    LOCK_SECONDS = (5 * 60)

    def initialize(name, password)
      @db_data = Database.find(name)
      @password = password
      self
    end

    def save
      Database.save(@db_data)
      self
    end

    def password=(new_password)
      @password = new_password
      self.digest = calculate_digest(password + salt)
      password
    end

    def salt=(new_salt)
      @db_data[:salt] = new_salt
      self.digest = calculate_digest(password + new_salt)
      salt
    end

    def can_login?
      unsuccessful_tries <= 3 ||
        (last_incorrect_login_try_at + LOCK_SECONDS <= Time.now.to_i)
    end

    def can_login_after
      last_incorrect_login_try_at + LOCK_SECONDS - Time.now.to_i
    end

    def correct_password?
      digest == calculate_digest(password + salt)
    end

    private

    def calculate_digest(string)
      Digest::SHA256.base64digest(string)
    end
  end
end
