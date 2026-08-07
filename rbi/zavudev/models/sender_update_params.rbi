# typed: strong

module Zavudev
  module Models
    class SenderUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::SenderUpdateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :sender_id

      # Attach or change the sender's email from-address (e.g. noreply@yourdomain.com).
      # The domain must be a verified email domain in your project.
      sig { returns(T.nilable(String)) }
      attr_reader :email_address

      sig { params(email_address: String).void }
      attr_writer :email_address

      # Enable or disable domain catch-all. When enabled (with emailReceivingEnabled
      # true), this sender receives email for any address at its domain. Ignored
      # (treated as false) if receiving is not enabled.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :email_catch_all_enabled

      sig { params(email_catch_all_enabled: T::Boolean).void }
      attr_writer :email_catch_all_enabled

      # ID of the verified email domain to attach. Optional — resolved from
      # `emailAddress`'s domain when omitted.
      sig { returns(T.nilable(String)) }
      attr_reader :email_domain_id

      sig { params(email_domain_id: String).void }
      attr_writer :email_domain_id

      # Display name shown in the recipient's inbox for the email channel.
      sig { returns(T.nilable(String)) }
      attr_reader :email_from_name

      sig { params(email_from_name: String).void }
      attr_writer :email_from_name

      # Enable or disable inbound email receiving for this sender.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :email_receiving_enabled

      sig { params(email_receiving_enabled: T::Boolean).void }
      attr_writer :email_receiving_enabled

      # Turn the one-way SMS channel on or off. Enabling needs nothing else and takes
      # effect immediately; disabling removes the channel from the sender. Confirm with
      # the `channels` array on the response.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_sms_oneway

      sig { params(enable_sms_oneway: T::Boolean).void }
      attr_writer :enable_sms_oneway

      # Turn the voice channel on or off. The sender must already have a phone number
      # provisioned for calls; enabling it otherwise returns 400 instead of storing a
      # flag that changes nothing. Confirm with the `channels` array on the response.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_voice

      sig { params(enable_voice: T::Boolean).void }
      attr_writer :enable_voice

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :set_as_default

      sig { params(set_as_default: T::Boolean).void }
      attr_writer :set_as_default

      # Whether the webhook is active.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :webhook_active

      sig { params(webhook_active: T::Boolean).void }
      attr_writer :webhook_active

      # Events to subscribe to.
      sig { returns(T.nilable(T::Array[Zavudev::WebhookEvent::OrSymbol])) }
      attr_reader :webhook_events

      sig do
        params(webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol]).void
      end
      attr_writer :webhook_events

      # Which `X-Zavu-Signature` scheme this receiver is sent.
      #
      # - `v1`: `v1=HMAC_SHA256(secret, body)`. The scheme used before this was
      #   configurable. Existing webhooks stay on it until you move them.
      # - `v2`: `v2=HMAC_SHA256(secret, "{t}.{body}")`. The current scheme, and the
      #   default for new senders. It signs the timestamp together with the body.
      # - `v1+v2`: both signatures, sharing one `t`. The migration setting: a receiver
      #   reading either one works, so you can deploy and confirm your new verifier
      #   before switching over.
      #
      # Moving from `v1` straight to `v2` returns `400`. Set `v1+v2` first. See
      # https://docs.zavu.dev/guides/receiving-messages/signature-migration
      sig do
        returns(
          T.nilable(
            Zavudev::SenderUpdateParams::WebhookSignatureVersion::OrSymbol
          )
        )
      end
      attr_reader :webhook_signature_version

      sig do
        params(
          webhook_signature_version:
            Zavudev::SenderUpdateParams::WebhookSignatureVersion::OrSymbol
        ).void
      end
      attr_writer :webhook_signature_version

      # HTTPS URL for webhook events. Set to null to remove webhook.
      sig { returns(T.nilable(String)) }
      attr_accessor :webhook_url

      sig do
        params(
          sender_id: String,
          email_address: String,
          email_catch_all_enabled: T::Boolean,
          email_domain_id: String,
          email_from_name: String,
          email_receiving_enabled: T::Boolean,
          enable_sms_oneway: T::Boolean,
          enable_voice: T::Boolean,
          name: String,
          set_as_default: T::Boolean,
          webhook_active: T::Boolean,
          webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol],
          webhook_signature_version:
            Zavudev::SenderUpdateParams::WebhookSignatureVersion::OrSymbol,
          webhook_url: T.nilable(String),
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        sender_id:,
        # Attach or change the sender's email from-address (e.g. noreply@yourdomain.com).
        # The domain must be a verified email domain in your project.
        email_address: nil,
        # Enable or disable domain catch-all. When enabled (with emailReceivingEnabled
        # true), this sender receives email for any address at its domain. Ignored
        # (treated as false) if receiving is not enabled.
        email_catch_all_enabled: nil,
        # ID of the verified email domain to attach. Optional — resolved from
        # `emailAddress`'s domain when omitted.
        email_domain_id: nil,
        # Display name shown in the recipient's inbox for the email channel.
        email_from_name: nil,
        # Enable or disable inbound email receiving for this sender.
        email_receiving_enabled: nil,
        # Turn the one-way SMS channel on or off. Enabling needs nothing else and takes
        # effect immediately; disabling removes the channel from the sender. Confirm with
        # the `channels` array on the response.
        enable_sms_oneway: nil,
        # Turn the voice channel on or off. The sender must already have a phone number
        # provisioned for calls; enabling it otherwise returns 400 instead of storing a
        # flag that changes nothing. Confirm with the `channels` array on the response.
        enable_voice: nil,
        name: nil,
        set_as_default: nil,
        # Whether the webhook is active.
        webhook_active: nil,
        # Events to subscribe to.
        webhook_events: nil,
        # Which `X-Zavu-Signature` scheme this receiver is sent.
        #
        # - `v1`: `v1=HMAC_SHA256(secret, body)`. The scheme used before this was
        #   configurable. Existing webhooks stay on it until you move them.
        # - `v2`: `v2=HMAC_SHA256(secret, "{t}.{body}")`. The current scheme, and the
        #   default for new senders. It signs the timestamp together with the body.
        # - `v1+v2`: both signatures, sharing one `t`. The migration setting: a receiver
        #   reading either one works, so you can deploy and confirm your new verifier
        #   before switching over.
        #
        # Moving from `v1` straight to `v2` returns `400`. Set `v1+v2` first. See
        # https://docs.zavu.dev/guides/receiving-messages/signature-migration
        webhook_signature_version: nil,
        # HTTPS URL for webhook events. Set to null to remove webhook.
        webhook_url: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            sender_id: String,
            email_address: String,
            email_catch_all_enabled: T::Boolean,
            email_domain_id: String,
            email_from_name: String,
            email_receiving_enabled: T::Boolean,
            enable_sms_oneway: T::Boolean,
            enable_voice: T::Boolean,
            name: String,
            set_as_default: T::Boolean,
            webhook_active: T::Boolean,
            webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol],
            webhook_signature_version:
              Zavudev::SenderUpdateParams::WebhookSignatureVersion::OrSymbol,
            webhook_url: T.nilable(String),
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Which `X-Zavu-Signature` scheme this receiver is sent.
      #
      # - `v1`: `v1=HMAC_SHA256(secret, body)`. The scheme used before this was
      #   configurable. Existing webhooks stay on it until you move them.
      # - `v2`: `v2=HMAC_SHA256(secret, "{t}.{body}")`. The current scheme, and the
      #   default for new senders. It signs the timestamp together with the body.
      # - `v1+v2`: both signatures, sharing one `t`. The migration setting: a receiver
      #   reading either one works, so you can deploy and confirm your new verifier
      #   before switching over.
      #
      # Moving from `v1` straight to `v2` returns `400`. Set `v1+v2` first. See
      # https://docs.zavu.dev/guides/receiving-messages/signature-migration
      module WebhookSignatureVersion
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::SenderUpdateParams::WebhookSignatureVersion)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        V1 =
          T.let(
            :v1,
            Zavudev::SenderUpdateParams::WebhookSignatureVersion::TaggedSymbol
          )
        V1_V2 =
          T.let(
            :"v1+v2",
            Zavudev::SenderUpdateParams::WebhookSignatureVersion::TaggedSymbol
          )
        V2 =
          T.let(
            :v2,
            Zavudev::SenderUpdateParams::WebhookSignatureVersion::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Zavudev::SenderUpdateParams::WebhookSignatureVersion::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
