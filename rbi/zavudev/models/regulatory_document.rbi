# typed: strong

module Zavudev
  module Models
    class RegulatoryDocument < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::RegulatoryDocument, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol) }
      attr_accessor :document_type

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Zavudev::RegulatoryDocument::Status::TaggedSymbol) }
      attr_accessor :status

      sig { returns(T.nilable(Integer)) }
      attr_reader :file_size

      sig { params(file_size: Integer).void }
      attr_writer :file_size

      sig { returns(T.nilable(String)) }
      attr_reader :mime_type

      sig { params(mime_type: String).void }
      attr_writer :mime_type

      sig { returns(T.nilable(String)) }
      attr_accessor :rejection_reason

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # A regulatory document for phone number requirements.
      sig do
        params(
          id: String,
          created_at: Time,
          document_type: Zavudev::RegulatoryDocument::DocumentType::OrSymbol,
          name: String,
          status: Zavudev::RegulatoryDocument::Status::OrSymbol,
          file_size: Integer,
          mime_type: String,
          rejection_reason: T.nilable(String),
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        document_type:,
        name:,
        status:,
        file_size: nil,
        mime_type: nil,
        rejection_reason: nil,
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            document_type:
              Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol,
            name: String,
            status: Zavudev::RegulatoryDocument::Status::TaggedSymbol,
            file_size: Integer,
            mime_type: String,
            rejection_reason: T.nilable(String),
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      module DocumentType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::RegulatoryDocument::DocumentType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PASSPORT =
          T.let(
            :passport,
            Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol
          )
        NATIONAL_ID =
          T.let(
            :national_id,
            Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol
          )
        DRIVERS_LICENSE =
          T.let(
            :drivers_license,
            Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol
          )
        UTILITY_BILL =
          T.let(
            :utility_bill,
            Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol
          )
        TAX_ID =
          T.let(
            :tax_id,
            Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol
          )
        BUSINESS_REGISTRATION =
          T.let(
            :business_registration,
            Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol
          )
        PROOF_OF_ADDRESS =
          T.let(
            :proof_of_address,
            Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol
          )
        OTHER =
          T.let(:other, Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::RegulatoryDocument::DocumentType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::RegulatoryDocument::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, Zavudev::RegulatoryDocument::Status::TaggedSymbol)
        UPLOADED =
          T.let(:uploaded, Zavudev::RegulatoryDocument::Status::TaggedSymbol)
        VERIFIED =
          T.let(:verified, Zavudev::RegulatoryDocument::Status::TaggedSymbol)
        REJECTED =
          T.let(:rejected, Zavudev::RegulatoryDocument::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::RegulatoryDocument::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
