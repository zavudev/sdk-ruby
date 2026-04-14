# typed: strong

module Zavudev
  module Models
    class InvitationListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::InvitationListParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Current status of the partner invitation.
      sig do
        returns(T.nilable(Zavudev::InvitationListParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: Zavudev::InvitationListParams::Status::OrSymbol).void
      end
      attr_writer :status

      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::InvitationListParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        cursor: nil,
        limit: nil,
        # Current status of the partner invitation.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            status: Zavudev::InvitationListParams::Status::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Current status of the partner invitation.
      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::InvitationListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING =
          T.let(:pending, Zavudev::InvitationListParams::Status::TaggedSymbol)
        IN_PROGRESS =
          T.let(
            :in_progress,
            Zavudev::InvitationListParams::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(:completed, Zavudev::InvitationListParams::Status::TaggedSymbol)
        EXPIRED =
          T.let(:expired, Zavudev::InvitationListParams::Status::TaggedSymbol)
        CANCELLED =
          T.let(:cancelled, Zavudev::InvitationListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::InvitationListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
