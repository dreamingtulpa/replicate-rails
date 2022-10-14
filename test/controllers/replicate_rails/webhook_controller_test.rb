require "test_helper"

class ReplicateRails::WebhookControllerTest < ActionController::TestCase
  def payload
    @payload ||= File.read(File.join(FIXTURES_DIR, "evt_prediction_completed.json")).strip
  end

  setup do
    @routes = ReplicateRails::Engine.routes

    ReplicateRails.configure do |config|
      config.webhook_adapter = ReplicateWebhook.new
    end
  end

  test "should post prediction event" do
    ReplicateWebhook.any_instance.expects(:call).returns(true)
    post :event, format: :json, body: payload
    assert_response :success
  end
end
