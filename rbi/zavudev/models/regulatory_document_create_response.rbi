# typed: strong

module Zavudev
  module Models
    class RegulatoryDocumentCreateResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::RegulatoryDocumentCreateResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # A regulatory document for phone number requirements.
      sig { returns(Zavudev::RegulatoryDocument) }
      attr_reader :document

      sig { params(document: Zavudev::RegulatoryDocument::OrHash).void }
      attr_writer :document

      sig do
        params(document: Zavudev::RegulatoryDocument::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        # A regulatory document for phone number requirements.
        document:
      )
      end

      sig { override.returns({ document: Zavudev::RegulatoryDocument }) }
      def to_hash
      end
    end
  end
end
