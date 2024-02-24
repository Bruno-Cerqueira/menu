require 'prometheus/client'

class ApplicationController < ActionController::Base
  CONTROLLER_CALLS = Prometheus::Client::Counter.new(:controller_calls_total,
                                                     docstring: 'Total number of controller calls', labels: %i[method path])

  def increment_request_count
    CONTROLLER_CALLS.increment(labels: { method: request.method, path: request.path })
    Prometheus::Client.registry.register(CONTROLLER_CALLS)
  end
end
