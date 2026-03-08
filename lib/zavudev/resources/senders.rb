# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      # @return [Zavudev::Resources::Senders::Agent]
      attr_reader :agent

      # Create sender
      #
      # @overload create(name:, phone_number:, set_as_default: nil, webhook_events: nil, webhook_url: nil, request_options: {})
      #
      # @param name [String]
      #
      # @param phone_number [String]
      #
      # @param set_as_default [Boolean]
      #
      # @param webhook_events [Array<Symbol, Zavudev::Models::WebhookEvent>] Events to subscribe to.
      #
      # @param webhook_url [String] HTTPS URL for webhook events.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Sender]
      #
      # @see Zavudev::Models::SenderCreateParams
      def create(params)
        parsed, options = Zavudev::SenderCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/senders",
          body: parsed,
          model: Zavudev::Sender,
          options: options
        )
      end

      # Get sender
      #
      # @overload retrieve(sender_id, request_options: {})
      #
      # @param sender_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Sender]
      #
      # @see Zavudev::Models::SenderRetrieveParams
      def retrieve(sender_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/senders/%1$s", sender_id],
          model: Zavudev::Sender,
          options: params[:request_options]
        )
      end

      # Update sender
      #
      # @overload update(sender_id, email_receiving_enabled: nil, name: nil, set_as_default: nil, webhook_active: nil, webhook_events: nil, webhook_url: nil, request_options: {})
      #
      # @param sender_id [String]
      #
      # @param email_receiving_enabled [Boolean] Enable or disable inbound email receiving for this sender.
      #
      # @param name [String]
      #
      # @param set_as_default [Boolean]
      #
      # @param webhook_active [Boolean] Whether the webhook is active.
      #
      # @param webhook_events [Array<Symbol, Zavudev::Models::WebhookEvent>] Events to subscribe to.
      #
      # @param webhook_url [String, nil] HTTPS URL for webhook events. Set to null to remove webhook.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::Sender]
      #
      # @see Zavudev::Models::SenderUpdateParams
      def update(sender_id, params = {})
        parsed, options = Zavudev::SenderUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/senders/%1$s", sender_id],
          body: parsed,
          model: Zavudev::Sender,
          options: options
        )
      end

      # List senders
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String]
      # @param limit [Integer]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::Sender>]
      #
      # @see Zavudev::Models::SenderListParams
      def list(params = {})
        parsed, options = Zavudev::SenderListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/senders",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Sender,
          options: options
        )
      end

      # Delete sender
      #
      # @overload delete(sender_id, request_options: {})
      #
      # @param sender_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Zavudev::Models::SenderDeleteParams
      def delete(sender_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/senders/%1$s", sender_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Get the WhatsApp Business profile for a sender. The sender must have a WhatsApp
      # Business Account connected.
      #
      # @overload get_profile(sender_id, request_options: {})
      #
      # @param sender_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::WhatsappBusinessProfileResponse]
      #
      # @see Zavudev::Models::SenderGetProfileParams
      def get_profile(sender_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/senders/%1$s/profile", sender_id],
          model: Zavudev::WhatsappBusinessProfileResponse,
          options: params[:request_options]
        )
      end

      # Regenerate the webhook secret for a sender. The old secret will be invalidated
      # immediately.
      #
      # @overload regenerate_webhook_secret(sender_id, request_options: {})
      #
      # @param sender_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::WebhookSecretResponse]
      #
      # @see Zavudev::Models::SenderRegenerateWebhookSecretParams
      def regenerate_webhook_secret(sender_id, params = {})
        @client.request(
          method: :post,
          path: ["v1/senders/%1$s/webhook/secret", sender_id],
          model: Zavudev::WebhookSecretResponse,
          options: params[:request_options]
        )
      end

      # Update the WhatsApp Business profile for a sender. The sender must have a
      # WhatsApp Business Account connected.
      #
      # @overload update_profile(sender_id, about: nil, address: nil, description: nil, email: nil, vertical: nil, websites: nil, request_options: {})
      #
      # @param sender_id [String]
      #
      # @param about [String] Short description of the business (max 139 characters).
      #
      # @param address [String] Physical address of the business (max 256 characters).
      #
      # @param description [String] Extended description of the business (max 512 characters).
      #
      # @param email [String] Business email address.
      #
      # @param vertical [Symbol, Zavudev::Models::WhatsappBusinessProfileVertical] Business category for WhatsApp Business profile.
      #
      # @param websites [Array<String>] Business website URLs (maximum 2).
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::SenderUpdateProfileResponse]
      #
      # @see Zavudev::Models::SenderUpdateProfileParams
      def update_profile(sender_id, params = {})
        parsed, options = Zavudev::SenderUpdateProfileParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/senders/%1$s/profile", sender_id],
          body: parsed,
          model: Zavudev::Models::SenderUpdateProfileResponse,
          options: options
        )
      end

      # Upload a new profile picture for the WhatsApp Business profile. The image will
      # be uploaded to Meta and set as the profile picture.
      #
      # @overload upload_profile_picture(sender_id, image_url:, mime_type:, request_options: {})
      #
      # @param sender_id [String]
      #
      # @param image_url [String] URL of the image to upload.
      #
      # @param mime_type [Symbol, Zavudev::Models::SenderUploadProfilePictureParams::MimeType] MIME type of the image.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::SenderUploadProfilePictureResponse]
      #
      # @see Zavudev::Models::SenderUploadProfilePictureParams
      def upload_profile_picture(sender_id, params)
        parsed, options = Zavudev::SenderUploadProfilePictureParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/senders/%1$s/profile/picture", sender_id],
          body: parsed,
          model: Zavudev::Models::SenderUploadProfilePictureResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
        @agent = Zavudev::Resources::Senders::Agent.new(client: client)
      end
    end
  end
end
