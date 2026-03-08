# typed: strong

module Zavudev
  module Models
    class RegulatoryDocumentCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Zavudev::RegulatoryDocumentCreateParams,
            Zavudev::Internal::AnyHash
          )
        end

      sig do
        returns(Zavudev::RegulatoryDocumentCreateParams::DocumentType::OrSymbol)
      end
      attr_accessor :document_type

      sig { returns(Integer) }
      attr_accessor :file_size

      sig { returns(String) }
      attr_accessor :mime_type

      sig { returns(String) }
      attr_accessor :name

      # Storage ID from the upload-url endpoint.
      sig { returns(String) }
      attr_accessor :storage_id

      sig do
        params(
          document_type:
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::OrSymbol,
          file_size: Integer,
          mime_type: String,
          name: String,
          storage_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        document_type:,
        file_size:,
        mime_type:,
        name:,
        # Storage ID from the upload-url endpoint.
        storage_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            document_type:
              Zavudev::RegulatoryDocumentCreateParams::DocumentType::OrSymbol,
            file_size: Integer,
            mime_type: String,
            name: String,
            storage_id: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      module DocumentType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::RegulatoryDocumentCreateParams::DocumentType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PASSPORT =
          T.let(
            :passport,
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::TaggedSymbol
          )
        NATIONAL_ID =
          T.let(
            :national_id,
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::TaggedSymbol
          )
        DRIVERS_LICENSE =
          T.let(
            :drivers_license,
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::TaggedSymbol
          )
        UTILITY_BILL =
          T.let(
            :utility_bill,
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::TaggedSymbol
          )
        TAX_ID =
          T.let(
            :tax_id,
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::TaggedSymbol
          )
        BUSINESS_REGISTRATION =
          T.let(
            :business_registration,
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::TaggedSymbol
          )
        PROOF_OF_ADDRESS =
          T.let(
            :proof_of_address,
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::TaggedSymbol
          )
        OTHER =
          T.let(
            :other,
            Zavudev::RegulatoryDocumentCreateParams::DocumentType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Zavudev::RegulatoryDocumentCreateParams::DocumentType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
