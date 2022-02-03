class CarsController < ApplicationController
  def mileage
    render json: { mileage: car_resource.fetch_mileage.to_s }
  end

  def lock
    if params[:request_id]
      external_request = ExternalRequest.find params[:request_id]
      render json: { result: external_request.state }
    else
      # render json: { success: car_resource.lock }
      # TODO:
      #   create ExternalRequest
      external_request = car_resource.external_requests.create(request_type: :lock)

      LockJob.perform_later(external_request.id)

      render json: { request_id: external_request.id }
    end
  end

  def unlock
    render json: { success: car_resource.unlock }
  end

  private

  def car_resource
    @car ||= Car.find(params[:id])
  end
end
