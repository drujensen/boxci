module Shanty
  class Provider < Thor
    include Thor::Actions

    no_commands do
      def self.source_root
        File.dirname(__FILE__)
      end

      def self.supported_providers
        @@supported_providers ||= []
      end

      def self.inherited(subclass)
        self.supported_providers << subclass.to_s.split('::').last.downcase
      end

      def generate_provider_config
        raise "generate_provider_config must be implemented on Shanty::Provider classes"
      end
    end
  end
end