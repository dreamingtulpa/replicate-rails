module ReplicateRails
  class WebhookController < ActionController::Base
    if Rails.application.config.action_controller.default_protect_from_forgery
      skip_before_action :verify_authenticity_token
    end

    def event
      ReplicateRails.config.webhook_adapter.call(prediction)
      head :ok
    rescue ReplicateRails::WebhookError
      head :unprocessable_entity
    end

    private

    def prediction
      Replicate::Record::Prediction.new(Replicate.client, JSON.parse(request.body.read))
    end
  end
end
