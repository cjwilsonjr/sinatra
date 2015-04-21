class User < ActiveRecord::Base
  include BCrypt

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, message: "must be at least 3 characters"}
  validates :email, presence: true, uniqueness: true, format: /.+@.+\..+/
  validates :password, presence: true, length: { minimum: 6 }

#getter method used for logging in
#makes new BCrypt object from password digest in database
  def password
    @password ||= Password.new(password_digest)
  end

#setter method used for creating user
#takes plaintext password and makes a new BCrypt object
#writes string hash to database, bcrypt hash meets up with attribute in dtabase
  def password=(plaintext_pass)
    @password = plaintext_pass
    self.password_digest = Password.create(plaintext_pass)
  end

  def self.authenticate(email, supplied_password)
    user = User.find_by_email(email)
    return user if user && user.password == supplied_password
    nil
  end
end
