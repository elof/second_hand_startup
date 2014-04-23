# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string(255)
#  email               :string(255)
#  password_digest     :string(255)
#  image_url           :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  provider            :string(255)
#  uid                 :string(255)
#  remember_token      :string(255)
#  image_url_file_name :string(255)
#  image_content_type  :string(255)
#  image_file_size     :integer
#  image_updated_at    :datetime
#  image_file_name     :string(255)
#

class User < ActiveRecord::Base



#omniAuth method for sessionscreate controller
  def self.create_with_omniauth(auth)
    create! do |user|
      user.username = auth["info"]["nickname"]
      user.password_digest = SecureRandom.urlsafe_base64
      user.password = auth["info"]["secret"] 
      user.password_confirmation = auth["info"]["secret"] 
      user.provider = auth["provider"]
      user.email = auth["uid"]
      user.uid = auth["uid"]
      user.image_url = auth["info"]["image"]
      user.image_file_name = auth["info"]["image"]
    end
  end

  attr_accessible :username, :image_url_file_name, :image_file_name, :email, :image_url, :image, :password, :password_digest, :password_confirmation, :provider, :uid
  # attr_accessor :image_file_name, :image_updated_at, :image_file_size, :image_content_type
  has_secure_password
  
  has_many :events
  has_many :rsvps
  has_many :events
  has_many :comments, :dependent => :destroy

  has_attached_file :image, styles:{
    thumb: '85x85>',
    square: '150x150#',
    medium: '300x200>'
  }


  # before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  #After matching one or more alphanumeric characters, if there's a separator it must be followed by one or more alphanumerics; repeat as needed.
  VALID_USERNAME_REGEX = /^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$/
  validates :username,  presence: true, format: {with: VALID_USERNAME_REGEX }, length: { maximum: 15 }, uniqueness: true

  # Must have at least one word character -> an @ sign -> at least one letter,digit, hyphen, or dot -> 
  #a literal dot -> at least one letter (no repeating dots)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }


  validate :email_or_provider
  validate :email_format
  validate :password_length

  def email_or_provider
    unless (self.email && self.password && self.password_confirmation) || self.provider
      flash[:error] = "Please Sign in."
    end
  end

  def email_format
    if(email)
      unless(email =~ VALID_EMAIL_REGEX)
        return "error message"
      end
    end
  end

  def password_length
    if(password.nil? or password.length < 7 )
        return "Password must be at least 6 characters."
    end
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
