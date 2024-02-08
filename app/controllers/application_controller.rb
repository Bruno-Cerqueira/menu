require 'prometheus/client'

class ApplicationController < ActionController::Base
  before_action :increment_request_count

  def increment_request_count
    counter = Prometheus::Client::Counter.new(:requests_total, 'Total number of requests')
    counter.increment({ method: request.method, path: request.path })
  end
end