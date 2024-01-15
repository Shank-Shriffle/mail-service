class Train < ApplicationRecord
  belongs_to :operator, class_name: 'TrainOperator'
  has_many :parcels
  has_one :track

  after_update :change_parcel_status

  enum status: { available: 0, booked: 1 }

  private

  def change_parcel_status
    byebug
    if booked?
      parcels.update_all(status: 'shipped')
      track.closed!
   end
  end
end
  