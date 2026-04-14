# typed: strong

module Zavudev
  module Models
    class VerifiedURL < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::VerifiedURL, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      # Domain extracted from the URL.
      sig { returns(String) }
      attr_accessor :domain

      # Status of a verified URL.
      sig { returns(Zavudev::VerifiedURL::Status::TaggedSymbol) }
      attr_accessor :status

      # The verified URL.
      sig { returns(String) }
      attr_accessor :url

      # How the URL was approved or rejected.
      sig do
        returns(T.nilable(Zavudev::VerifiedURL::ApprovalType::TaggedSymbol))
      end
      attr_reader :approval_type

      sig do
        params(approval_type: Zavudev::VerifiedURL::ApprovalType::OrSymbol).void
      end
      attr_writer :approval_type

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      sig do
        params(
          id: String,
          created_at: Time,
          domain: String,
          status: Zavudev::VerifiedURL::Status::OrSymbol,
          url: String,
          approval_type: Zavudev::VerifiedURL::ApprovalType::OrSymbol,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        # Domain extracted from the URL.
        domain:,
        # Status of a verified URL.
        status:,
        # The verified URL.
        url:,
        # How the URL was approved or rejected.
        approval_type: nil,
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            domain: String,
            status: Zavudev::VerifiedURL::Status::TaggedSymbol,
            url: String,
            approval_type: Zavudev::VerifiedURL::ApprovalType::TaggedSymbol,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      # Status of a verified URL.
      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::VerifiedURL::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING = T.let(:pending, Zavudev::VerifiedURL::Status::TaggedSymbol)
        APPROVED = T.let(:approved, Zavudev::VerifiedURL::Status::TaggedSymbol)
        REJECTED = T.let(:rejected, Zavudev::VerifiedURL::Status::TaggedSymbol)
        MALICIOUS =
          T.let(:malicious, Zavudev::VerifiedURL::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Zavudev::VerifiedURL::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      # How the URL was approved or rejected.
      module ApprovalType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::VerifiedURL::ApprovalType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MANUAL =
          T.let(:manual, Zavudev::VerifiedURL::ApprovalType::TaggedSymbol)
        AUTO_WEB_RISK =
          T.let(
            :auto_web_risk,
            Zavudev::VerifiedURL::ApprovalType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::VerifiedURL::ApprovalType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
