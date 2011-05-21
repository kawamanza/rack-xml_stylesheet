require 'rubygems'
require 'test/unit'
require 'rack/mock'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rack/xml_stylesheet'

begin
  require "redgreen"
  require "ruby-debug"
rescue LoadError
  # Not required gems.
end

