# typed: strong

module Zavudev
  module Resources
    class Senders
      sig { returns(Zavudev::Resources::Senders::Agent) }
      attr_reader :agent

      sig { returns(Zavudev::Resources::Senders::WhatsappSync) }
      attr_reader :whatsapp_sync

      # Create sender
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
        ).returns(Zavudev::Sender)
      end
      def create(
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

      # Get sender
      sig do
        params(
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Sender)
      end
      def retrieve(sender_id, request_options: {})
      end

      # Update sender
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
          webhook_url: T.nilable(String),
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Sender)
      end
      def update(
        sender_id,
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
        # HTTPS URL for webhook events. Set to null to remove webhook.
        webhook_url: nil,
        request_options: {}
      )
      end

      # List senders
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Sender])
      end
      def list(cursor: nil, limit: nil, request_options: {})
      end

      # Delete sender
      sig do
        params(
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def delete(sender_id, request_options: {})
      end

      # Get the WhatsApp Business profile for a sender. The sender must have a WhatsApp
      # Business Account connected.
      sig do
        params(
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::WhatsappBusinessProfileResponse)
      end
      def get_profile(sender_id, request_options: {})
      end

      # Regenerate the webhook secret for a sender. The old secret will be invalidated
      # immediately.
      sig do
        params(
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::WebhookSecretResponse)
      end
      def regenerate_webhook_secret(sender_id, request_options: {})
      end

      # Update the WhatsApp Business profile for a sender. The sender must have a
      # WhatsApp Business Account connected.
      sig do
        params(
          sender_id: String,
          about: String,
          address: String,
          description: String,
          email: String,
          vertical: Zavudev::WhatsappBusinessProfileVertical::OrSymbol,
          websites: T::Array[String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::SenderUpdateProfileResponse)
      end
      def update_profile(
        sender_id,
        # Short description of the business (max 139 characters).
        about: nil,
        # Physical address of the business (max 256 characters).
        address: nil,
        # Extended description of the business (max 512 characters).
        description: nil,
        # Business email address.
        email: nil,
        # Business category for WhatsApp Business profile.
        vertical: nil,
        # Business website URLs (maximum 2).
        websites: nil,
        request_options: {}
      )
      end

      # Upload a new profile picture for the WhatsApp Business profile. The image will
      # be uploaded to Meta and set as the profile picture.
      sig do
        params(
          sender_id: String,
          image_url: String,
          mime_type:
            Zavudev::SenderUploadProfilePictureParams::MimeType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::SenderUploadProfilePictureResponse)
      end
      def upload_profile_picture(
        sender_id,
        # URL of the image to upload.
        image_url:,
        # MIME type of the image.
        mime_type:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
