class User < ActiveRecord::Base

	has_many :uris
  validates :username, uniqueness: true

  def self.authenticate(username, password)
    @user = User.find_by_username(username)

    return false if @user.nil?
    if @user.password == password
      return @user
    else
      return false
    end
  end

end
