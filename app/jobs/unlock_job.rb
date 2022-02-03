class UnlockJob < ApplicationJob
  def perform(external_request_id)
    external_request = ExternalRequest.find(external_request_id)

    result = external_request.unlock

    external_request.update!(
      state: :succeeded,
      payload: result.to_s
    )
  rescue StandardError
    external_request.update! state: :failed
  end
end
