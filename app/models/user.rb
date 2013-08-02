class User < ActiveRecord::Base
  attr_accessible :username, :email, :password_digest, :image_url


  has_many :rsvps
  has_many :events
  has_many :comments
  # has_many :messages


end
