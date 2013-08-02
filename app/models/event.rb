class Event < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :comments
  has_many :rsvps
  belongs_to :user

end
