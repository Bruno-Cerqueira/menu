require 'prometheus/client'
module Prometheus
  module Controller
    CONTROLLER_CALLS = Prometheus::Client::Counter.new(:controller_calls_total, docstring: 'Total number of controller calls', labels: [:method, :path])
    prometheus = Prometheus::Client.registry
    gauge = Prometheus::Client::Gauge.new(:online_menu, docstring: 'Health check for Online Menu')
    prometheus.register(gauge)
    prometheus.register(CONTROLLER_CALLS)
  end
end