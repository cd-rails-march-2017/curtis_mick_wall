class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_REGEX}
  validates :password, confirmation: true, presence: true, length: {minimum: 8}

  def self.login username, password
    if User.exists?(:username => username)
      user = User.find_by_username(username)
      if user.password == password
        return user
      end
    end
    return nil
  end
end
