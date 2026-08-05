# typed: strong

module Zavudev
  module Models
    class SenderCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::SenderCreateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      # From-address for the email channel (e.g. noreply@yourdomain.com). The address's
      # domain must be a verified email domain in your project. Setting this attaches
      # the email channel to the sender.
      sig { returns(T.nilable(String)) }
      attr_reader :email_address

      sig { params(email_address: String).void }
      attr_writer :email_address

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

      # Enable inbound email receiving on this sender. Requires a verified MX record on
      # the domain; ignored otherwise.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :email_receiving_enabled

      sig { params(email_receiving_enabled: T::Boolean).void }
      attr_writer :email_receiving_enabled

      # Enable the one-way SMS channel (`sms_oneway`). Needs nothing else — no phone
      # number, no credential — so it is the fastest way to get a sender that can send.
      # Recipients cannot reply. Confirm with `sms_oneway` in the `channels` array on
      # the response.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_sms_oneway

      sig { params(enable_sms_oneway: T::Boolean).void }
      attr_writer :enable_sms_oneway

      # Let this sender place and answer phone calls. Requires `phoneNumber`; enabling
      # it without one returns 400. Check the `channels` array on the response to
      # confirm `voice` is on.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :enable_voice

      sig { params(enable_voice: T::Boolean).void }
      attr_writer :enable_voice

      # Phone number in E.164 format, and it must be a number your project already owns
      # (see `GET /v1/phone-numbers`). The number is routed to the sender as part of
      # this call, which is what turns the SMS channel on. Passing a number the project
      # does not own, or one already attached to another sender, returns 400 rather than
      # creating a sender that cannot send. Omit for an email-only sender.
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :set_as_default

      sig { params(set_as_default: T::Boolean).void }
      attr_writer :set_as_default

      # Events to subscribe to.
      sig { returns(T.nilable(T::Array[Zavudev::WebhookEvent::OrSymbol])) }
      attr_reader :webhook_events

      sig do
        params(webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol]).void
      end
      attr_writer :webhook_events

      # HTTPS URL for webhook events.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_url

      sig { params(webhook_url: String).void }
      attr_writer :webhook_url

      sig do
        params(
          name: String,
          email_address: String,
          email_domain_id: String,
          email_from_name: String,
          email_receiving_enabled: T::Boolean,
          enable_sms_oneway: T::Boolean,
          enable_voice: T::Boolean,
          phone_number: String,
          set_as_default: T::Boolean,
          webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol],
          webhook_url: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        # From-address for the email channel (e.g. noreply@yourdomain.com). The address's
        # domain must be a verified email domain in your project. Setting this attaches
        # the email channel to the sender.
        email_address: nil,
        # ID of the verified email domain to attach. Optional — resolved from
        # `emailAddress`'s domain when omitted.
        email_domain_id: nil,
        # Display name shown in the recipient's inbox for the email channel.
        email_from_name: nil,
        # Enable inbound email receiving on this sender. Requires a verified MX record on
        # the domain; ignored otherwise.
        email_receiving_enabled: nil,
        # Enable the one-way SMS channel (`sms_oneway`). Needs nothing else — no phone
        # number, no credential — so it is the fastest way to get a sender that can send.
        # Recipients cannot reply. Confirm with `sms_oneway` in the `channels` array on
        # the response.
        enable_sms_oneway: nil,
        # Let this sender place and answer phone calls. Requires `phoneNumber`; enabling
        # it without one returns 400. Check the `channels` array on the response to
        # confirm `voice` is on.
        enable_voice: nil,
        # Phone number in E.164 format, and it must be a number your project already owns
        # (see `GET /v1/phone-numbers`). The number is routed to the sender as part of
        # this call, which is what turns the SMS channel on. Passing a number the project
        # does not own, or one already attached to another sender, returns 400 rather than
        # creating a sender that cannot send. Omit for an email-only sender.
        phone_number: nil,
        set_as_default: nil,
        # Events to subscribe to.
        webhook_events: nil,
        # HTTPS URL for webhook events.
        webhook_url: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            email_address: String,
            email_domain_id: String,
            email_from_name: String,
            email_receiving_enabled: T::Boolean,
            enable_sms_oneway: T::Boolean,
            enable_voice: T::Boolean,
            phone_number: String,
            set_as_default: T::Boolean,
            webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol],
            webhook_url: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
