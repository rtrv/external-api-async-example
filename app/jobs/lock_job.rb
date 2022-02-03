class LockJob < ApplicationJob
  def perform(external_request_id)
    external_request = ExternalRequest.find(external_request_id)

    external_request.update! state: :requested
    result = external_request.lock

    external_request.update!(
      state: 'succeeded',
      payload: result.to_s
    )
  rescue StandardError
    external_request.update! state: :failed
  end
end
