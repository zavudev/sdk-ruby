# typed: strong

module Zavudev
  module Models
    class FunctionUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::FunctionUpdateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :function_id

      # New dependency map (replaces existing dependencies).
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :dependencies

      sig { params(dependencies: T::Hash[Symbol, String]).void }
      attr_writer :dependencies

      # Expose the function on its public HTTPS URL, or take it down. Applies to the
      # already-deployed function without redeploying; the URL is returned as
      # `publicUrl`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :http_enabled

      sig { params(http_enabled: T::Boolean).void }
      attr_writer :http_enabled

      # New source code for the draft (replaces it).
      sig { returns(T.nilable(String)) }
      attr_reader :source_code

      sig { params(source_code: String).void }
      attr_writer :source_code

      sig do
        params(
          function_id: String,
          dependencies: T::Hash[Symbol, String],
          http_enabled: T::Boolean,
          source_code: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        function_id:,
        # New dependency map (replaces existing dependencies).
        dependencies: nil,
        # Expose the function on its public HTTPS URL, or take it down. Applies to the
        # already-deployed function without redeploying; the URL is returned as
        # `publicUrl`.
        http_enabled: nil,
        # New source code for the draft (replaces it).
        source_code: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            function_id: String,
            dependencies: T::Hash[Symbol, String],
            http_enabled: T::Boolean,
            source_code: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
