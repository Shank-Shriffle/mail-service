class ReopenTrackJob < ApplicationJob
  queue_as :default

  def perform(track)
    track.update(status: 'open')
  end
end
