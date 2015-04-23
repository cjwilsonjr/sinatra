class User < ActiveRecord::Base
  include BCrypt

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, message: "must be at least 3 characters"}
  validates :email, presence: true, uniqueness: true, format: /.+@.+\..+/
  validates :password, presence: true, length: { minimum: 6 }

  has_many :playlists, foreign_key: :creator_id
  has_many :track_listings
  has_many :collaborators, through: :playlists, source: :contributor




  def password
    @password ||= Password.new(password_digest)
  end


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
