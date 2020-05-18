class Event < ApplicationRecord
  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee
  belongs_to :creator, class_name: 'User'

  scope :past, -> {
    where('event_date < :current_time', current_time: DateTime.now)
  }
  scope :upcoming, -> {
    where('event_date >= :current_time', current_time: DateTime.now)
  }

end
