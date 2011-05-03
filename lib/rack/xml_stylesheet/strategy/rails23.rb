module Rack
  module XMLStylesheet::Strategy
    class Rails23 < Base

      protected

      def template_path
        @template_path ||= result[2].template.instance_variable_get("@_first_render").template_path
      end

      def public_path
        super || Rails.public_path
      end

    end
  end
end