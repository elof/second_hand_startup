# == Schema Information
#
# Table name: rsvps
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#

class Rsvp < ActiveRecord::Base
  attr_accessible :user_id, :event_id


  belongs_to :user
  belongs_to :event
  
end
