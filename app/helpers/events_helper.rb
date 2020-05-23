module EventsHelper
  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :event_date,
      :location
    )
  end

  def upcoming?
    Event.upcoming.include?(self)
  end
end
