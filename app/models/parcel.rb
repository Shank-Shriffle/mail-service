class Parcel < ApplicationRecord
  belongs_to :owner, class_name: 'ParcelOwner'
  belongs_to :train, optional: true

  enum status: { waiting: 0, shipped: 1 }
end
