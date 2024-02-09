# This file is used by Rack-based servers to start the application.
require_relative "config/environment"

require 'prometheus/middleware/exporter'
require 'rack'

# Middleware for Gzip compression
use Rack::Deflater

# Middleware for creating prometheus exporter
use Prometheus::Middleware::Exporter
run ->(_) { [200, {'content-type' => 'text/html'}, ['OK']] }

run Rails.application
Rails.application.load_server
