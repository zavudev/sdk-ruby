# typed: strong

module Zavudev
  module Models
    class URLEscalateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::URLEscalateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :url_id

      # Why the URL should be reviewed manually.
      sig { returns(String) }
      attr_accessor :reason

      sig do
        params(
          url_id: String,
          reason: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        url_id:,
        # Why the URL should be reviewed manually.
        reason:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            url_id: String,
            reason: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
