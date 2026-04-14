# typed: strong

module Zavudev
  module Models
    class URLSubmitForVerificationParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::URLSubmitForVerificationParams,
            Zavudev::Internal::AnyHash
          )
        end

      # The URL to submit for verification.
      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          url: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The URL to submit for verification.
        url:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { url: String, request_options: Zavudev::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
