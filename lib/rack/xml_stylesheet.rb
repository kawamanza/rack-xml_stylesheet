module Rack
  class XMLStylesheet
    autoload :Strategy, 'rack/xml_stylesheet/strategy.rb'
    autoload :VERSION, 'rack/xml_stylesheet/version.rb'

    attr_reader :options

    def initialize(app, *args)
      @app = app
      @options = args.last.is_a?(Hash) ? args.last : {}
      @strategy = Strategy::Rails23
    end

    def call(env)
      result = @app.call(env)
      @strategy.new(result, options).add_processing_instructions
      result
    end
  end
end
