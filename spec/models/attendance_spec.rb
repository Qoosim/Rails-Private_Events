# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'ActiveRecord Associations' do
    it { should belong_to(:event_attendee) }

    it { should belong_to(:attended_event) }
  end
end