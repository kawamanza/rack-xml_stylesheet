module Rack
  class XMLStylesheet
    version = nil
    version = $1 if ::File.expand_path('../../..', __FILE__) =~ /[\/\\]rack-xml_stylesheet-([\w\.\-]+)/
    if version.nil? && ::File.exists?(::File.expand_path('../../../../.git', __FILE__))
      begin
        require "step-up"
        version = StepUp::Driver::Git.new.last_version_tag
      rescue LoadError
      end
    end
    version = "0.0.0" if version.nil?
    VERSION = version.gsub(/^v?([^\+]+)\+?\d*$/, '\1')
  end
end
