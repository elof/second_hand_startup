# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  date                :string(255)
#  time                :string(255)
#  event_type          :string(255)
#  description         :text
#  cost                :float
#  location            :string(255)
#  coordinates         :string(255)
#  min_attendee_number :integer
#  max_attendee_number :integer
#  image_url           :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  latitude            :float
#  longitude           :float
#  meridian            :string(255)
#

# FOR THE SAKE OF SEEDING: I added id and user_id as attr_accessible -Karl

class Event < ActiveRecord::Base
  attr_accessible :name, :date, :start_time, :end_time, :event_type, :description, :cost, :location, :coordinates, :min_attendee_number, :max_attendee_number, :image_url, :id, :user_id, :longitude, :latitude,:meridian_start, :meridian_end

  acts_as_commentable

  has_many :comments
  has_many :rsvps

  belongs_to :user

  serialize :coordinates, Array

  validates :name, presence: true
  # validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :event_type, presence: true
  validates :description, presence: true
  validates :location, presence: true
  geocoded_by :location
  after_validation :geocode
  # validates :min_attendee_number, presence: true
  # validates :max_attendee_number, presence: true
end
