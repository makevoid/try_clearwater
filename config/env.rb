require 'bundler'
Bundler.require :default

Opal.append_path File.expand_path('../assets/js', __FILE__)


require 'tilt/haml'
require 'tilt/opal'
