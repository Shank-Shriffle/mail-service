class Account < ApplicationRecord
  validates :name, presence: true
  
  def postmaster?
    type = 'Postmaster'
  end

  def parcel_owner?
    type = 'ParcelOwner'
  end

  def train_operator?
    type = 'TrainOperator'
  end 
end
