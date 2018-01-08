require 'bundler'
require 'rack/sendfile'

require_relative 'lib/imageproxy'

use ImageProxy::Cache

cache_dir = ENV['IMAGE_CACHE_DIR'] ? ENV['IMAGE_CACHE_DIR'] : '/tmp/'

ImageProxy::Cache.cache_dir = cache_dir

run Rack::Sendfile.new(ImageProxy::Server.new)
