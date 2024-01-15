class AddAssignedTracksToTrain < ActiveRecord::Migration[7.1]
  def change
    add_column :trains, :assigned_tracks, :text, array: true, default: []
  end
end
