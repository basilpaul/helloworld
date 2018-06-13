require 'serverspec'

set :backend, :exec
set :path, '/sbin:/usb/sbin:$PATH'

require 'busser/rubygems'
Busser::RubyGems.install_gem('faraday', '~> 0')
Busser::RubyGems.install_gem('json', '~> 0')
require 'faraday'
require 'json'
require 'uri'