# Replicate Rails Gem

This gem bundles the [replicate-ruby](https://github.com/dreamingtulpa/replicate-ruby) gem and adds webhook support for replicate.com.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'replicate-rails', require: 'replicate_rails'
```

## Usage

Setup an initializer and webhook adapter class:

```ruby
# config/initializers/replicate.rb
Replicate.client.api_token = "your-api-token"

ReplicateRails.configure do |config|
  config.webhook_adapter = ReplicateWebhook.new
end

class ReplicateWebhook
  def call(prediction)
    # do your thing
  end
end
```

and mount the route:

```ruby
# config/routes.rb
mount ReplicateRails::Engine => "/replicate/webhook"
```

Now you can run predictions as follows:

```
model = Replicate.client.retrieve_model("stability-ai/stable-diffusion")
version = model.latest_version
version.predict(prompt: "a beautiful sunset", "https://yourdomain.tld/replicate/webhook")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.
