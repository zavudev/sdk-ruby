# typed: strong

module Zavudev
  module Models
    class URLRetrieveDetailsResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::URLRetrieveDetailsResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(Zavudev::VerifiedURL) }
      attr_reader :url

      sig { params(url: Zavudev::VerifiedURL::OrHash).void }
      attr_writer :url

      sig do
        params(url: Zavudev::VerifiedURL::OrHash).returns(T.attached_class)
      end
      def self.new(url:)
      end

      sig { override.returns({ url: Zavudev::VerifiedURL }) }
      def to_hash
      end
    end
  end
end
