# typed: strong

module Zavudev
  module Models
    class URLEscalateResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::URLEscalateResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :message

      sig { returns(Zavudev::VerifiedURL) }
      attr_reader :url

      sig { params(url: Zavudev::VerifiedURL::OrHash).void }
      attr_writer :url

      sig do
        params(message: String, url: Zavudev::VerifiedURL::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(message:, url:)
      end

      sig { override.returns({ message: String, url: Zavudev::VerifiedURL }) }
      def to_hash
      end
    end
  end
end
