# == Schema Information
#
# Table name: rsvps
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rsvp < ActiveRecord::Base
  # attr_accessible :title, :body


  belongs_to :user
  belongs_to :event
  
end
