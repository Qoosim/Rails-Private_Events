module EventsHelper
  def upcoming?
    Event.upcoming.include?(self)
  end
end
