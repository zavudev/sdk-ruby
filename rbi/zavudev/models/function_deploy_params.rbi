# typed: strong

module Zavudev
  module Models
    class FunctionDeployParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::FunctionDeployParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :function_id

      # New dependency map (replaces existing dependencies).
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :dependencies

      sig { params(dependencies: T::Hash[Symbol, String]).void }
      attr_writer :dependencies

      # New source code to publish (replaces the draft).
      sig { returns(T.nilable(String)) }
      attr_reader :source_code

      sig { params(source_code: String).void }
      attr_writer :source_code

      sig do
        params(
          function_id: String,
          dependencies: T::Hash[Symbol, String],
          source_code: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        function_id:,
        # New dependency map (replaces existing dependencies).
        dependencies: nil,
        # New source code to publish (replaces the draft).
        source_code: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            function_id: String,
            dependencies: T::Hash[Symbol, String],
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
