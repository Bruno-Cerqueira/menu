require 'prometheus/client'
module Prometheus
  module Controller
    prometheus = Prometheus::Client.registry
    gauge = Prometheus::Client::Gauge.new(:online_menu, docstring: 'Health check for Online Menu')
    prometheus.register(gauge)
  end
end
