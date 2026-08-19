# typed: strong

module Zavudev
  module Models
    class EmailDomainCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::EmailDomainCreateParams, Zavudev::Internal::AnyHash)
        end

      # Bare domain, e.g. example.com.
      sig { returns(String) }
      attr_accessor :domain

      sig do
        params(
          domain: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Bare domain, e.g. example.com.
        domain:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { domain: String, request_options: Zavudev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
