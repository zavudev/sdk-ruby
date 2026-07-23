# typed: strong

module Zavudev
  module Models
    class Invitation < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::Invitation, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      # Unique invitation token.
      sig { returns(String) }
      attr_accessor :token

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(Time) }
      attr_accessor :expires_at

      # Current status of the partner invitation.
      sig { returns(Zavudev::Invitation::Status::TaggedSymbol) }
      attr_accessor :status

      sig { returns(Time) }
      attr_accessor :updated_at

      # Full URL to share with the client.
      sig { returns(String) }
      attr_accessor :url

      sig { returns(T.nilable(String)) }
      attr_accessor :client_email

      sig { returns(T.nilable(String)) }
      attr_accessor :client_name

      sig { returns(T.nilable(String)) }
      attr_accessor :client_phone

      sig { returns(T.nilable(Time)) }
      attr_accessor :completed_at

      # How the client connects WhatsApp: `whatsapp_waba` (official Cloud API via
      # embedded signup).
      sig do
        returns(T.nilable(Zavudev::Invitation::ConnectionType::TaggedSymbol))
      end
      attr_reader :connection_type

      sig do
        params(
          connection_type: Zavudev::Invitation::ConnectionType::OrSymbol
        ).void
      end
      attr_writer :connection_type

      # ID of a pre-assigned Zavu phone number for WhatsApp registration.
      sig { returns(T.nilable(String)) }
      attr_accessor :phone_number_id

      # ID of the sender created when invitation is completed.
      sig { returns(T.nilable(String)) }
      attr_accessor :sender_id

      sig { returns(T.nilable(Time)) }
      attr_accessor :started_at

      sig { returns(T.nilable(Time)) }
      attr_accessor :viewed_at

      sig do
        params(
          id: String,
          token: String,
          created_at: Time,
          expires_at: Time,
          status: Zavudev::Invitation::Status::OrSymbol,
          updated_at: Time,
          url: String,
          client_email: T.nilable(String),
          client_name: T.nilable(String),
          client_phone: T.nilable(String),
          completed_at: T.nilable(Time),
          connection_type: Zavudev::Invitation::ConnectionType::OrSymbol,
          phone_number_id: T.nilable(String),
          sender_id: T.nilable(String),
          started_at: T.nilable(Time),
          viewed_at: T.nilable(Time)
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Unique invitation token.
        token:,
        created_at:,
        expires_at:,
        # Current status of the partner invitation.
        status:,
        updated_at:,
        # Full URL to share with the client.
        url:,
        client_email: nil,
        client_name: nil,
        client_phone: nil,
        completed_at: nil,
        # How the client connects WhatsApp: `whatsapp_waba` (official Cloud API via
        # embedded signup).
        connection_type: nil,
        # ID of a pre-assigned Zavu phone number for WhatsApp registration.
        phone_number_id: nil,
        # ID of the sender created when invitation is completed.
        sender_id: nil,
        started_at: nil,
        viewed_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            token: String,
            created_at: Time,
            expires_at: Time,
            status: Zavudev::Invitation::Status::TaggedSymbol,
            updated_at: Time,
            url: String,
            client_email: T.nilable(String),
            client_name: T.nilable(String),
            client_phone: T.nilable(String),
            completed_at: T.nilable(Time),
            connection_type: Zavudev::Invitation::ConnectionType::TaggedSymbol,
            phone_number_id: T.nilable(String),
            sender_id: T.nilable(String),
            started_at: T.nilable(Time),
            viewed_at: T.nilable(Time)
          }
        )
      end
      def to_hash
      end

      # Current status of the partner invitation.
      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::Invitation::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PENDING = T.let(:pending, Zavudev::Invitation::Status::TaggedSymbol)
        IN_PROGRESS =
          T.let(:in_progress, Zavudev::Invitation::Status::TaggedSymbol)
        COMPLETED = T.let(:completed, Zavudev::Invitation::Status::TaggedSymbol)
        EXPIRED = T.let(:expired, Zavudev::Invitation::Status::TaggedSymbol)
        CANCELLED = T.let(:cancelled, Zavudev::Invitation::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Zavudev::Invitation::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      # How the client connects WhatsApp: `whatsapp_waba` (official Cloud API via
      # embedded signup).
      module ConnectionType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::Invitation::ConnectionType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WHATSAPP_WABA =
          T.let(
            :whatsapp_waba,
            Zavudev::Invitation::ConnectionType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::Invitation::ConnectionType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
