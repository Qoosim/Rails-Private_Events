class RenameEventDateToDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :event_date, :date
  end
end
