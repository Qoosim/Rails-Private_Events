class User < ApplicationRecord
  has_many :attendance
  has_many :


  has_secure_password
end


user => creator
user => attendee
event => attended_event
@upcoming_events = current_user.upcoming_events
