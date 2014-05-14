require 'bundler'
require 'rack/sendfile'
require 'pry'

require_relative 'cache'

require File.join(File.expand_path(File.dirname(__FILE__)), "lib", "imageproxy")

use ImageProxy::Cache

ImageProxy::Cache.cache_dir = '/tmp/cache/'

run Rack::Sendfile.new(ImageProxy::Server.new)
