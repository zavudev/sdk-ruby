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
          phone_number: String,
          set_as_default: T::Boolean,
          webhook_events: T::Array[Zavudev::WebhookEvent::OrSymbol],
          webhook_url: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Sender)
      end
      def create(
        name:,
        phone_number:,
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
          email_receiving_enabled: T::Boolean,
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
        # Enable or disable inbound email receiving for this sender.
        email_receiving_enabled: nil,
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
