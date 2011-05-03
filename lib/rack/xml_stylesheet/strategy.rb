module Rack
  module XMLStylesheet::Strategy
    autoload :Rails23, 'rack/xml_stylesheet/strategy/rails23.rb'

    class Base
      attr_reader :options
      attr_reader :result

      def initialize(result, options)
        @result = result
        @options = options
      end

      def add_processing_instructions
        add_processing_instructions! if may_add_processing_instructions?
      end

      protected

      def may_add_processing_instructions?
        has_content? && is_xml? && ! has_processing_instructions? && ! template_path.blank? && xsl_exists?
      end

      def add_processing_instructions!
        instruction = "<?xml-stylesheet type=\"text/xsl\" href=\"#{xsl_path}\"\?>#{instructions[/(\r\n|\n)\z/, 1]}"
        result[2].body.insert instructions.length, instruction
        content_length = result[2].headers["Content-Length"].to_i
        result[2].headers["Content-Length"] = (content_length + instruction.length).to_s if content_length > 0
      end

      def has_content?
        not [204, 301, 302, 304].include?(result[0])
      end

      def is_xml?
        result[2].headers["Content-Type"] =~ /[\/\+]xml(?:;|\z)/
      end

      def has_processing_instructions?
        instructions =~ /<\?xml-stylesheet.*?\?>/m
      end

      def xsl_exists?
        # public_path/xsl_subpath/layout_name/controller_name/action_name.xsl
        ::File.exists? ::File.join(public_path, xsl_path)
      end

      def public_path
        options[:public_path]
      end

      def xsl_path
        @xsl_path ||= ::File.join("", xsl_subpath, "layouts", layout_name, xsl_template)
      end

      def xsl_subpath
        options[:xsl_path] || "xsl"
      end

      def layout_name
        @layout_name ||= result[2].headers.delete("XSL-Layout") || options[:default_layout] || "default"
      end

      def xsl_template
        @xsl_template ||= template_path.sub(/(?:\.[^\.]*|)$/, ".xsl")
      end

      def template_path
        # abstract
      end

      def instructions
        @instructions ||= result[2].body[/\A(.*?)<\w/m, 1]
      end
    end
  end
end
