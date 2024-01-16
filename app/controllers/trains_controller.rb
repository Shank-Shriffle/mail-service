class TrainsController < ApplicationController
  before_action :get_train, only: %i[ show update destroy ]
  
  def index
    @trains = Train.all
    render json: @trains
  end

  def show
    render json: @train
  end

  def create
    @train = Train.new(train_params)
    if @train.save
      render json: @train, status: :created
    else
      render json: @train.errors, status: :unprocessable_entity
    end
  end

  def update
    if @train.update(train_params)
      render json: @train
    else
      render json: @train.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @train.destroy
  end

  private

  def get_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:name, :cost, :weight_capacity, :volume_capacity, :operator_id, assigned_tracks: [])
  end
end
