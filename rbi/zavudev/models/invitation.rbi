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
      #
      # `failed` means the client started the connection and it did not finish (they
      # cancelled Meta's dialog, denied a permission, or abandoned the tab). A failed
      # invitation is still usable: the same link can be retried, and it moves back to
      # `in_progress` when the client tries again.
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

      # The account the client linked, populated once the invitation is `completed`.
      # Null before that. Use it to show the partner what was connected without fetching
      # the sender.
      sig { returns(T.nilable(Zavudev::Invitation::ConnectedAccount)) }
      attr_reader :connected_account

      sig do
        params(
          connected_account:
            T.nilable(Zavudev::Invitation::ConnectedAccount::OrHash)
        ).void
      end
      attr_writer :connected_account

      # Which Meta channel the client connects: `whatsapp_waba` (official WhatsApp Cloud
      # API via embedded signup) or `messenger` (a Facebook Page's Messenger inbox,
      # including Marketplace chats).
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

      sig { returns(T.nilable(Time)) }
      attr_accessor :failed_at

      # Stable code for why the last attempt failed, present when `status` is `failed`.
      # Values include `fb_cancelled` (client closed Meta's dialog), `fb_not_authorized`
      # (permission denied), `signup_abandoned` (started but never finished),
      # `meta_no_pages` (the client administers no Facebook Page), and `internal_error`.
      # Treat unknown codes as a generic failure.
      sig { returns(T.nilable(String)) }
      attr_accessor :failure_reason

      # ID of a pre-assigned Zavu phone number for WhatsApp registration. Always null
      # for `messenger` invitations.
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
          connected_account:
            T.nilable(Zavudev::Invitation::ConnectedAccount::OrHash),
          connection_type: Zavudev::Invitation::ConnectionType::OrSymbol,
          failed_at: T.nilable(Time),
          failure_reason: T.nilable(String),
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
        #
        # `failed` means the client started the connection and it did not finish (they
        # cancelled Meta's dialog, denied a permission, or abandoned the tab). A failed
        # invitation is still usable: the same link can be retried, and it moves back to
        # `in_progress` when the client tries again.
        status:,
        updated_at:,
        # Full URL to share with the client.
        url:,
        client_email: nil,
        client_name: nil,
        client_phone: nil,
        completed_at: nil,
        # The account the client linked, populated once the invitation is `completed`.
        # Null before that. Use it to show the partner what was connected without fetching
        # the sender.
        connected_account: nil,
        # Which Meta channel the client connects: `whatsapp_waba` (official WhatsApp Cloud
        # API via embedded signup) or `messenger` (a Facebook Page's Messenger inbox,
        # including Marketplace chats).
        connection_type: nil,
        failed_at: nil,
        # Stable code for why the last attempt failed, present when `status` is `failed`.
        # Values include `fb_cancelled` (client closed Meta's dialog), `fb_not_authorized`
        # (permission denied), `signup_abandoned` (started but never finished),
        # `meta_no_pages` (the client administers no Facebook Page), and `internal_error`.
        # Treat unknown codes as a generic failure.
        failure_reason: nil,
        # ID of a pre-assigned Zavu phone number for WhatsApp registration. Always null
        # for `messenger` invitations.
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
            connected_account: T.nilable(Zavudev::Invitation::ConnectedAccount),
            connection_type: Zavudev::Invitation::ConnectionType::TaggedSymbol,
            failed_at: T.nilable(Time),
            failure_reason: T.nilable(String),
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
      #
      # `failed` means the client started the connection and it did not finish (they
      # cancelled Meta's dialog, denied a permission, or abandoned the tab). A failed
      # invitation is still usable: the same link can be retried, and it moves back to
      # `in_progress` when the client tries again.
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
        FAILED = T.let(:failed, Zavudev::Invitation::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Zavudev::Invitation::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      class ConnectedAccount < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Invitation::ConnectedAccount,
              Zavudev::Internal::AnyHash
            )
          end

        # Provider-side identifier: the WhatsApp phone number ID, or the Facebook Page ID.
        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(Zavudev::Invitation::ConnectedAccount::Channel::TaggedSymbol)
        end
        attr_accessor :channel

        # Display name of the connected account: the WhatsApp verified name, or the
        # Facebook Page name.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The account the client linked, populated once the invitation is `completed`.
        # Null before that. Use it to show the partner what was connected without fetching
        # the sender.
        sig do
          params(
            id: String,
            channel: Zavudev::Invitation::ConnectedAccount::Channel::OrSymbol,
            name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Provider-side identifier: the WhatsApp phone number ID, or the Facebook Page ID.
          id:,
          channel:,
          # Display name of the connected account: the WhatsApp verified name, or the
          # Facebook Page name.
          name: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              channel:
                Zavudev::Invitation::ConnectedAccount::Channel::TaggedSymbol,
              name: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Channel
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::Invitation::ConnectedAccount::Channel)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WHATSAPP =
            T.let(
              :whatsapp,
              Zavudev::Invitation::ConnectedAccount::Channel::TaggedSymbol
            )
          MESSENGER =
            T.let(
              :messenger,
              Zavudev::Invitation::ConnectedAccount::Channel::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Invitation::ConnectedAccount::Channel::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Which Meta channel the client connects: `whatsapp_waba` (official WhatsApp Cloud
      # API via embedded signup) or `messenger` (a Facebook Page's Messenger inbox,
      # including Marketplace chats).
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
        MESSENGER =
          T.let(:messenger, Zavudev::Invitation::ConnectionType::TaggedSymbol)

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
