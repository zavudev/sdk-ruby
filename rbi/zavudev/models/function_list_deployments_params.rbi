# typed: strong

module Zavudev
  module Models
    class FunctionListDeploymentsParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::FunctionListDeploymentsParams,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :function_id

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          function_id: String,
          limit: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(function_id:, limit: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            function_id: String,
            limit: Integer,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
