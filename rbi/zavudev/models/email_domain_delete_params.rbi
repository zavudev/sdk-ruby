# typed: strong

module Zavudev
  module Models
    class EmailDomainDeleteParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::EmailDomainDeleteParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :domain_id

      sig do
        params(
          domain_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(domain_id:, request_options: {})
      end

      sig do
        override.returns(
          { domain_id: String, request_options: Zavudev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
