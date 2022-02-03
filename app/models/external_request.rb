class ExternalRequest < ApplicationRecord
  belongs_to :car
  # TODO:
  #   state machine: created, requested, failed, succeeded

  def lock
    car.lock
  end

  def unlock
    car.unlock
  end
end
