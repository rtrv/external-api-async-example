class Car < ApplicationRecord
  def fetch_mileage
    MileageFetcher.new.perform
  end

  class MileageFetcher
    def perform
      sleep 3

      9000
    end
  end
end
