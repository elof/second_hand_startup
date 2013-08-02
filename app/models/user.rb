class User < ActiveRecord::Base
  # attr_accessible :title, :body


  has_many :rsvps
  has_many :events
  has_many :comments
  # has_many :messages


end
