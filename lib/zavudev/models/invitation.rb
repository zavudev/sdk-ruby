# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Invitations#list
    class Invitation < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute token
      #   Unique invitation token.
      #
      #   @return [String]
      required :token, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute expires_at
      #
      #   @return [Time]
      required :expires_at, Time, api_name: :expiresAt

      # @!attribute status
      #   Current status of the partner invitation.
      #
      #   `failed` means the client started the connection and it did not finish (they
      #   cancelled Meta's dialog, denied a permission, or abandoned the tab). A failed
      #   invitation is still usable: the same link can be retried, and it moves back to
      #   `in_progress` when the client tries again.
      #
      #   @return [Symbol, Zavudev::Models::Invitation::Status]
      required :status, enum: -> { Zavudev::Invitation::Status }

      # @!attribute updated_at
      #
      #   @return [Time]
      required :updated_at, Time, api_name: :updatedAt

      # @!attribute url
      #   Full URL to share with the client.
      #
      #   @return [String]
      required :url, String

      # @!attribute client_email
      #
      #   @return [String, nil]
      optional :client_email, String, api_name: :clientEmail, nil?: true

      # @!attribute client_name
      #
      #   @return [String, nil]
      optional :client_name, String, api_name: :clientName, nil?: true

      # @!attribute client_phone
      #
      #   @return [String, nil]
      optional :client_phone, String, api_name: :clientPhone, nil?: true

      # @!attribute completed_at
      #
      #   @return [Time, nil]
      optional :completed_at, Time, api_name: :completedAt, nil?: true

      # @!attribute connected_account
      #   The account the client linked, populated once the invitation is `completed`.
      #   Null before that. Use it to show the partner what was connected without fetching
      #   the sender.
      #
      #   @return [Zavudev::Models::Invitation::ConnectedAccount, nil]
      optional :connected_account,
               -> { Zavudev::Invitation::ConnectedAccount },
               api_name: :connectedAccount,
               nil?: true

      # @!attribute connection_type
      #   Which Meta channel the client connects: `whatsapp_waba` (official WhatsApp Cloud
      #   API via embedded signup) or `messenger` (a Facebook Page's Messenger inbox,
      #   including Marketplace chats).
      #
      #   @return [Symbol, Zavudev::Models::Invitation::ConnectionType, nil]
      optional :connection_type, enum: -> { Zavudev::Invitation::ConnectionType }, api_name: :connectionType

      # @!attribute failed_at
      #
      #   @return [Time, nil]
      optional :failed_at, Time, api_name: :failedAt, nil?: true

      # @!attribute failure_reason
      #   Stable code for why the last attempt failed, present when `status` is `failed`.
      #   Values include `fb_cancelled` (client closed Meta's dialog), `fb_not_authorized`
      #   (permission denied), `signup_abandoned` (started but never finished),
      #   `meta_no_pages` (the client administers no Facebook Page), and `internal_error`.
      #   Treat unknown codes as a generic failure.
      #
      #   @return [String, nil]
      optional :failure_reason, String, api_name: :failureReason, nil?: true

      # @!attribute phone_number_id
      #   ID of a pre-assigned Zavu phone number for WhatsApp registration. Always null
      #   for `messenger` invitations.
      #
      #   @return [String, nil]
      optional :phone_number_id, String, api_name: :phoneNumberId, nil?: true

      # @!attribute sender_id
      #   ID of the sender created when invitation is completed.
      #
      #   @return [String, nil]
      optional :sender_id, String, api_name: :senderId, nil?: true

      # @!attribute started_at
      #
      #   @return [Time, nil]
      optional :started_at, Time, api_name: :startedAt, nil?: true

      # @!attribute viewed_at
      #
      #   @return [Time, nil]
      optional :viewed_at, Time, api_name: :viewedAt, nil?: true

      # @!method initialize(id:, token:, created_at:, expires_at:, status:, updated_at:, url:, client_email: nil, client_name: nil, client_phone: nil, completed_at: nil, connected_account: nil, connection_type: nil, failed_at: nil, failure_reason: nil, phone_number_id: nil, sender_id: nil, started_at: nil, viewed_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::Invitation} for more details.
      #
      #   @param id [String]
      #
      #   @param token [String] Unique invitation token.
      #
      #   @param created_at [Time]
      #
      #   @param expires_at [Time]
      #
      #   @param status [Symbol, Zavudev::Models::Invitation::Status] Current status of the partner invitation.
      #
      #   @param updated_at [Time]
      #
      #   @param url [String] Full URL to share with the client.
      #
      #   @param client_email [String, nil]
      #
      #   @param client_name [String, nil]
      #
      #   @param client_phone [String, nil]
      #
      #   @param completed_at [Time, nil]
      #
      #   @param connected_account [Zavudev::Models::Invitation::ConnectedAccount, nil] The account the client linked, populated once the invitation is `completed`. Nul
      #
      #   @param connection_type [Symbol, Zavudev::Models::Invitation::ConnectionType] Which Meta channel the client connects: `whatsapp_waba` (official WhatsApp Cloud
      #
      #   @param failed_at [Time, nil]
      #
      #   @param failure_reason [String, nil] Stable code for why the last attempt failed, present when `status` is `failed`.
      #
      #   @param phone_number_id [String, nil] ID of a pre-assigned Zavu phone number for WhatsApp registration. Always null fo
      #
      #   @param sender_id [String, nil] ID of the sender created when invitation is completed.
      #
      #   @param started_at [Time, nil]
      #
      #   @param viewed_at [Time, nil]

      # Current status of the partner invitation.
      #
      # `failed` means the client started the connection and it did not finish (they
      # cancelled Meta's dialog, denied a permission, or abandoned the tab). A failed
      # invitation is still usable: the same link can be retried, and it moves back to
      # `in_progress` when the client tries again.
      #
      # @see Zavudev::Models::Invitation#status
      module Status
        extend Zavudev::Internal::Type::Enum

        PENDING = :pending
        IN_PROGRESS = :in_progress
        COMPLETED = :completed
        EXPIRED = :expired
        CANCELLED = :cancelled
        FAILED = :failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Zavudev::Models::Invitation#connected_account
      class ConnectedAccount < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #   Provider-side identifier: the WhatsApp phone number ID, or the Facebook Page ID.
        #
        #   @return [String]
        required :id, String

        # @!attribute channel
        #
        #   @return [Symbol, Zavudev::Models::Invitation::ConnectedAccount::Channel]
        required :channel, enum: -> { Zavudev::Invitation::ConnectedAccount::Channel }

        # @!attribute name
        #   Display name of the connected account: the WhatsApp verified name, or the
        #   Facebook Page name.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!method initialize(id:, channel:, name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::Invitation::ConnectedAccount} for more details.
        #
        #   The account the client linked, populated once the invitation is `completed`.
        #   Null before that. Use it to show the partner what was connected without fetching
        #   the sender.
        #
        #   @param id [String] Provider-side identifier: the WhatsApp phone number ID, or the Facebook Page ID.
        #
        #   @param channel [Symbol, Zavudev::Models::Invitation::ConnectedAccount::Channel]
        #
        #   @param name [String, nil] Display name of the connected account: the WhatsApp verified name, or the Facebo

        # @see Zavudev::Models::Invitation::ConnectedAccount#channel
        module Channel
          extend Zavudev::Internal::Type::Enum

          WHATSAPP = :whatsapp
          MESSENGER = :messenger

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Which Meta channel the client connects: `whatsapp_waba` (official WhatsApp Cloud
      # API via embedded signup) or `messenger` (a Facebook Page's Messenger inbox,
      # including Marketplace chats).
      #
      # @see Zavudev::Models::Invitation#connection_type
      module ConnectionType
        extend Zavudev::Internal::Type::Enum

        WHATSAPP_WABA = :whatsapp_waba
        MESSENGER = :messenger

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
