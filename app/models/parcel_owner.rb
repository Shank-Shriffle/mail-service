class ParcelOwner < Account
  has_many :parcels, foreign_key: :owner_id, dependent: :destroy
end