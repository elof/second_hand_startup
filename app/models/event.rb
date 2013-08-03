# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  date                :date
#  time                :time
#  type                :string(255)
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
#

class Event < ActiveRecord::Base
  attr_accessible :name, :date, :time, :type, :description, :cost, :location, :coordinates, :min_attendee_number, :max_attendee_number, :image_url

  has_many :comments
  has_many :rsvps

  belongs_to :user

  serialize :coordinates, Array

end
