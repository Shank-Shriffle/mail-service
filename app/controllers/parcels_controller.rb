class ParcelsController < ApplicationController
  before_action :get_parcel, only: %i[ show destroy ]
  
  def index
    @parcels = Parcel.all
    render json: @parcels
  end

  def show
    render json: @parcel
  end

  def create
    @parcel = Parcel.new(parcel_params)
    if @parcel.save
      render json: @parcel, status: :created
    else
      render json: @parcel.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @parcel.destroy
  end

  private

  def get_parcel
    byebug
    @parcel = Parcel.find(params[:id])
  end

  def parcel_params
    params.require(:parcel).permit(:weight, :volume, :owner_id)
  end
end
