module UsersHelper
  # require 'date'
  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end

  # def upcoming_events
  #   attended_events.select { |event| event.date >= Date.now }
  # end
  #
  # def past_events
  #   attended_events.select { |event| event.date < Date.now }
  # end

end
