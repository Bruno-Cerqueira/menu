require 'prometheus/client'

class ApplicationController < ActionController::Base
  before_action :increment_request_count

  def increment_request_count
    prometheus_register = Prometheus::Client.registry
    counter = Prometheus::Client::Counter.new(:requests_total, docstring: 'Total number of requests', labels: [:method, :path])
    counter.increment(labels: { method: request.method, path: request.path })

    prometheus_register.register(counter)
  end
end