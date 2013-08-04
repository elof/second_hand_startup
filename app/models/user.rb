# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  image_url       :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :email, :image_url, :password, :password_confirmation
  has_secure_password
  

  has_many :rsvps
  has_many :events
  has_many :comments
  # has_many :messages

  before_save { |user| user.email = user.email.downcase }

  #After matching one or more alphanumeric characters, if there's a separator it must be followed by one or more alphanumerics; repeat as needed.
  VALID_USERNAME_REGEX = /^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$/
  validates :username,  presence: true, format: {with: VALID_USERNAME_REGEX }, length: { maximum: 50 }, uniqueness: true

  #Must have at least one word character -> an @ sign -> at least one letter,digit, hyphen, or dot -> a literal dot -> at least one letter
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }


  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true


end
