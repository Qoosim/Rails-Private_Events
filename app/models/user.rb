class User < ApplicationRecord
  include UsersHelper

 has_many :attendance, foreign_key: :event_attendee_id  # event_creator_id
 has_many :attended_events, through: :attendance
 has_many :created_events, foreign_key: :creator_id, class_name: 'Event'

 has_secure_password

 def upcoming_events
   attended_events.select { |event| event.date >= Date.now }
 end

 def past_events
   attended_events.select { |event| event.date < Date.now }
 end
end
