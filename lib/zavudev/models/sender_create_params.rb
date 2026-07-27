# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Senders#create
    class SenderCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute email_address
      #   From-address for the email channel (e.g. noreply@yourdomain.com). The address's
      #   domain must be a verified email domain in your project. Setting this attaches
      #   the email channel to the sender.
      #
      #   @return [String, nil]
      optional :email_address, String, api_name: :emailAddress

      # @!attribute email_domain_id
      #   ID of the verified email domain to attach. Optional — resolved from
      #   `emailAddress`'s domain when omitted.
      #
      #   @return [String, nil]
      optional :email_domain_id, String, api_name: :emailDomainId

      # @!attribute email_from_name
      #   Display name shown in the recipient's inbox for the email channel.
      #
      #   @return [String, nil]
      optional :email_from_name, String, api_name: :emailFromName

      # @!attribute email_receiving_enabled
      #   Enable inbound email receiving on this sender. Requires a verified MX record on
      #   the domain; ignored otherwise.
      #
      #   @return [Boolean, nil]
      optional :email_receiving_enabled, Zavudev::Internal::Type::Boolean, api_name: :emailReceivingEnabled

      # @!attribute enable_voice
      #   Let this sender place and answer phone calls. Requires `phoneNumber`; enabling
      #   it without one returns 400. Check the `channels` array on the response to
      #   confirm `voice` is on.
      #
      #   @return [Boolean, nil]
      optional :enable_voice, Zavudev::Internal::Type::Boolean, api_name: :enableVoice

      # @!attribute phone_number
      #   Phone number in E.164 format, and it must be a number your project already owns
      #   (see `GET /v1/phone-numbers`). The number is routed to the sender as part of
      #   this call, which is what turns the SMS channel on. Passing a number the project
      #   does not own, or one already attached to another sender, returns 400 rather than
      #   creating a sender that cannot send. Omit for an email-only sender.
      #
      #   @return [String, nil]
      optional :phone_number, String, api_name: :phoneNumber

      # @!attribute set_as_default
      #
      #   @return [Boolean, nil]
      optional :set_as_default, Zavudev::Internal::Type::Boolean, api_name: :setAsDefault

      # @!attribute webhook_events
      #   Events to subscribe to.
      #
      #   @return [Array<Symbol, Zavudev::Models::WebhookEvent>, nil]
      optional :webhook_events,
               -> { Zavudev::Internal::Type::ArrayOf[enum: Zavudev::WebhookEvent] },
               api_name: :webhookEvents

      # @!attribute webhook_url
      #   HTTPS URL for webhook events.
      #
      #   @return [String, nil]
      optional :webhook_url, String, api_name: :webhookUrl

      # @!method initialize(name:, email_address: nil, email_domain_id: nil, email_from_name: nil, email_receiving_enabled: nil, enable_voice: nil, phone_number: nil, set_as_default: nil, webhook_events: nil, webhook_url: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::SenderCreateParams} for more details.
      #
      #   @param name [String]
      #
      #   @param email_address [String] From-address for the email channel (e.g. noreply@yourdomain.com). The address's
      #
      #   @param email_domain_id [String] ID of the verified email domain to attach. Optional — resolved from `emailAddres
      #
      #   @param email_from_name [String] Display name shown in the recipient's inbox for the email channel.
      #
      #   @param email_receiving_enabled [Boolean] Enable inbound email receiving on this sender. Requires a verified MX record on
      #
      #   @param enable_voice [Boolean] Let this sender place and answer phone calls. Requires `phoneNumber`; enabling i
      #
      #   @param phone_number [String] Phone number in E.164 format, and it must be a number your project already owns
      #
      #   @param set_as_default [Boolean]
      #
      #   @param webhook_events [Array<Symbol, Zavudev::Models::WebhookEvent>] Events to subscribe to.
      #
      #   @param webhook_url [String] HTTPS URL for webhook events.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
