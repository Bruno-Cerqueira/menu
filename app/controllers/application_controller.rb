require 'prometheus/client'

class ApplicationController < ActionController::Base
  before_action :increment_request_count

  def increment_request_count
    CONTROLLER_CALLS.increment(labels: { method: request.method, path: request.path })
  end
end