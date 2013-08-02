class Event < ActiveRecord::Base
  attr_accessible :name, :date, :time, :type, :description, :cost, :location, :coordinates, :min_attendee_number, :max_attendee_number, :image_url

  has_many :comments
  has_many :rsvps

  belongs_to :user

  serialize :coordinates, Array

end
