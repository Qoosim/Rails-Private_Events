class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.integer :attended_event_id, index: true
      t.integer :event_attendee_id, index: true

      t.timestamps
    end
  end
end
