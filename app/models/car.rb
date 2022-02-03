class Car < ApplicationRecord
  has_many :external_requests

  def fetch_mileage
    MileageFetcher.perform
  end

  def lock
    true
  end

  def unlock
    LockManager.unlock
  end

  class MileageFetcher
    def self.perform
      sleep 3

      9000
    end
  end
end
