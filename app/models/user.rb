class User < ActiveRecord::Base

  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     @user.provider = auth["provider"]
  #     @user.uid = auth["uid"]
  #     @user.username = auth["info"]["name"]
  #   end
  # end


  attr_accessible :username, :email, :image_url, :password, :password_confirmation
  has_secure_password
  

  has_many :rsvps
  has_many :events
  has_many :comments

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  #After matching one or more alphanumeric characters, if there's a separator it must be followed by one or more alphanumerics; repeat as needed.
  VALID_USERNAME_REGEX = /^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$/
  validates :username,  presence: true, format: {with: VALID_USERNAME_REGEX }, length: { maximum: 50 }, uniqueness: true

  #Must have at least one word character -> an @ sign -> at least one letter,digit, hyphen, or dot -> a literal dot -> at least one letter
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }


  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
