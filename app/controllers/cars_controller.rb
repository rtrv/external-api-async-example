class CarsController < ApplicationController
  def mileage
    render json: { mileage: car_resource.fetch_mileage.to_s }
  end

  private

  def car_resource
    @car ||= Car.find(params[:id])
  end
end
