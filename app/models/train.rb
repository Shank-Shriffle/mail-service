class Train < ApplicationRecord
  belongs_to :operator, class_name: 'TrainOperator'
  has_many :parcels
  has_one :track

  validates :name, presence: true

  enum status: { available: 0, booked: 1 }

  after_update :update_track_and_parcel_status

  private

  def update_track_and_parcel_status
    if booked?
      parcels.update_all(status: 'shipped')
      track.closed!
      ReopenTrackJob.set(wait: 1.minute).perform_later(track)
   end
  end
end
  