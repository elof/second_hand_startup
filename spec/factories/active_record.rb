FactoryGirl.define do 

factory :user do
    username 'exampleuser'
    email 'example@email.com'
    password 'example'
    password_confirmation 'example' 
end

factory :user_params, class:Hash do
  username 'Name'
  email 'user@email.com'
  password 'password'
  password_confirmation 'password'
  initialize_with { attributes } 
end

factory :invalid_user_params, class:Hash do
  email 'things'
  password '6'
  initialize_with { attributes }
end

factory :event do 
  name 'Example Event'
  date Date.today
  time Time.now
  event_type 'art'
  location '414 Brannan'
  description 'This is an example description for an event'
  cost 100.0
  coordinates ['37.7750, -122.4183']
  min_attendee_number 2
  max_attendee_number 50
end

factory :event_params, class:Hash do
  name 'Event Name'
  description 'Event description'
  initialize_with { attributes } 
end

factory :invalid_event_params, class:Hash do
  name ' '
  description ' '
  initialize_with { attributes }
end


factory :comment do
    content "I'm an inappropriate comment"
    user
end


end