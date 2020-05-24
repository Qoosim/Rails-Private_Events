# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, source: :event_attendee
  belongs_to :creator, class_name: 'User'

  validates :title, :description, :date, :location, presence: true

  require 'date'

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }

  def upcoming?
    Event.upcoming.include?(self)
  end

end
