# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :event_attendee
  belongs_to :creator, class_name: 'User'

  validates :title, :description, :event_date, :location, presence: true

  scope :past, -> {
    where('event_date < :current_time', current_time: Date.today)
  }
  scope :upcoming, -> {
    where('event_date >= :current_time', current_time: Date.today)
  }

  # def upcoming?
    # Event.upcoming.include?(self)
  # end
end
