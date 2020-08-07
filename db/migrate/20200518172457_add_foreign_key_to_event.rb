class AddForeignKeyToEvent < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attendances, :events, column: :attended_event_id
    add_foreign_key :attendances, :users, column: :event_attendee_id
    add_foreign_key :events, :users, column: :creator_id
  end
end
