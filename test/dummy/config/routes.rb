Rails.application.routes.draw do
  mount ReplicateRails::Engine => "/replicate/events"
end
