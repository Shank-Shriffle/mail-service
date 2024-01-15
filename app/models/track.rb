class Track < ApplicationRecord
  belongs_to :train, optional: true

  validates :name, presence: true
  enum status: { open: 0, closed: 1 }
end
