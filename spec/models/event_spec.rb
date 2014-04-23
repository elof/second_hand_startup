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

require 'spec_helper'

  describe Event do
    it { should have_many(:comments) }
    it { should have_many(:rsvps) }

    it { should belong_to(:user) }

    it { should respond_to(:name) }
    it { should respond_to(:date) }
    it { should respond_to(:time) }
    it { should respond_to(:type) }
    it { should respond_to(:description) }
    it { should respond_to(:cost) }
    it { should respond_to(:location) }
    it { should respond_to(:coordinates) }
    it { should respond_to(:min_attendee_number) }
    it { should respond_to(:max_attendee_number) }
    it { should respond_to(:image_url) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:cost) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:coordinates) }
    it { should validate_presence_of(:min_attendee_number) }
    it { should validate_presence_of(:max_attendee_number) }

  end
