class AddCreatorIdToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :creator_id, :integer, index: true
  end
end
