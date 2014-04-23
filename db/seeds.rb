# require 'date'

# Event.delete_all

# Event.create(id: 1,
#   user_id: 1,
#   date: Date.today,
#   start_time: Time.now,
#   end_time: Time.now,
#   event_type: '/assets/nightlife.png',
#   cost: "Cheap",
#   name: 'Check out Trax',
#   location: '515 Ashbury St., San Francisco',
#   description: 'There is a new bar that opened and I want to check it out. Anyone down?',
#   coordinates: [37.7669578, -122.4107966])
# Event.create(id: 2,
#   user_id: 1,
#   date: Date.today,
#   start_time: Time.now,
#   end_time: Time.now,
#   event_type: '/assets/other.png',
#   cost: "Cheap",
#   name: 'Art Gallery opening',
#   location: '414 Brannan St., San Francisco, CA',
#   description: 'So some dude totally just spends his days painting portraits of Ryan friggin Gosling. I wanna go check it out, anyone else down?',
#   coordinates: [37.7884425, -122.4027891])
# Event.create(id: 3,
#   user_id: 1,
#   date: Date.today,
#   start_time: Time.now,
#   end_time: Time.now,
#   event_type: '/assets/music.png',
#   location: '27 Dearborn St., San Francisco',
#   cost: "Free",
#   name: 'Arcade Fire secret gig',
#   description: 'Guys, I heard that AF is playing a secret gig in the Mission!',
#   coordinates: [37.7709423, -122.4564456])
# Event.create(id: 4,
#   user_id: 1,
#   date: Date.today,
#   start_time: Time.now,
#   end_time: Time.now,
#   event_type: '/assets/nightlife.png',
#   cost: "Cheap",
#   name: 'Happy Hour at m81',
#   location: '201 Mission St., San Francisco',
#   description: "It's been a long week, who wants to get trashed?",
#   coordinates: [37.8012957, -122.4114261])
# Event.create(id: 5,
#   user_id: 1,
#   date: Date.today,
#   start_time: Time.now,
#   end_time: Time.now,
#   event_type: '/assets/community.png',
#   cost: "15.00",
#   name: 'Street Sweeping Volunteers?',
#   location: '650 Howard St, San Francisco',
#   description: 'Lets clean the block! Time to give back to the city',
#   coordinates: [37.78, -122.4107966])
# Event.create(id: 6,
#   user_id: 1,
#   date: Date.today,
#   start_time: Time.now,
#   end_time: Time.now,
#   event_type: '/assets/sports.png',
#   cost: "15.00",
#   name: 'Pick-up Basketball',
#   location: '1031 Kearny St, San Francisco',
#   description: 'Shoot some hoops with some bros. Bring a spare ball, we keep losing the damn things.',
#   coordinates: [37.79, -122.4027891])
# Event.create(id: 7,
#   user_id: 1,
#   date: Date.today,
#   start_time: Time.now,
#   end_time: Time.now,
#   event_type: '/assets/music.png',
#   location: '980 Market St, San Francisco',
#   cost: "15.00",
#   name: 'Radiohead listening party',
#   description: 'So we can sort of get baked and meet-up and listen to Kid A. Ok Computer is not an option.',
#   coordinates: [37.774, -122.4564456])
# Event.create(id: 8,
#   user_id: 1,
#   date: Date.today,
#   start_time: Time.now,
#   end_time: Time.now,
#   event_type: '/assets/nightlife.png',
#   cost: "15.00",
#   name: 'Bloody Mary Meet-up',
#   location: '1033 Kearny St, San Francisco',
#   description: "There's an awesome bloody mary bar around these parts. Who wants to start the day the right way?",
#   coordinates: [37.8015, -122.4114261])

# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  date                :date
#  time                :time
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
#