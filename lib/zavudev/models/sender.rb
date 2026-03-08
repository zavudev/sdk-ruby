# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Senders#create
    class Sender < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute phone_number
      #   Phone number in E.164 format.
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute created_at
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute email_receiving_enabled
      #   Whether inbound email receiving is enabled for this sender.
      #
      #   @return [Boolean, nil]
      optional :email_receiving_enabled, Zavudev::Internal::Type::Boolean, api_name: :emailReceivingEnabled

      # @!attribute is_default
      #   Whether this sender is the project's default.
      #
      #   @return [Boolean, nil]
      optional :is_default, Zavudev::Internal::Type::Boolean, api_name: :isDefault

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!attribute webhook
      #   Webhook configuration for the sender.
      #
      #   @return [Zavudev::Models::SenderWebhook, nil]
      optional :webhook, -> { Zavudev::SenderWebhook }

      # @!attribute whatsapp
      #   WhatsApp Business Account information. Only present if a WABA is connected.
      #
      #   @return [Zavudev::Models::Sender::Whatsapp, nil]
      optional :whatsapp, -> { Zavudev::Sender::Whatsapp }

      # @!method initialize(id:, name:, phone_number:, created_at: nil, email_receiving_enabled: nil, is_default: nil, updated_at: nil, webhook: nil, whatsapp: nil)
      #   @param id [String]
      #
      #   @param name [String]
      #
      #   @param phone_number [String] Phone number in E.164 format.
      #
      #   @param created_at [Time]
      #
      #   @param email_receiving_enabled [Boolean] Whether inbound email receiving is enabled for this sender.
      #
      #   @param is_default [Boolean] Whether this sender is the project's default.
      #
      #   @param updated_at [Time]
      #
      #   @param webhook [Zavudev::Models::SenderWebhook] Webhook configuration for the sender.
      #
      #   @param whatsapp [Zavudev::Models::Sender::Whatsapp] WhatsApp Business Account information. Only present if a WABA is connected.

      # @see Zavudev::Models::Sender#whatsapp
      class Whatsapp < Zavudev::Internal::Type::BaseModel
        # @!attribute display_phone_number
        #   Display phone number.
        #
        #   @return [String, nil]
        optional :display_phone_number, String, api_name: :displayPhoneNumber

        # @!attribute payment_status
        #   Payment configuration status from Meta.
        #
        #   @return [Zavudev::Models::Sender::Whatsapp::PaymentStatus, nil]
        optional :payment_status, -> { Zavudev::Sender::Whatsapp::PaymentStatus }, api_name: :paymentStatus

        # @!attribute phone_number_id
        #   WhatsApp phone number ID from Meta.
        #
        #   @return [String, nil]
        optional :phone_number_id, String, api_name: :phoneNumberId

        # @!method initialize(display_phone_number: nil, payment_status: nil, phone_number_id: nil)
        #   WhatsApp Business Account information. Only present if a WABA is connected.
        #
        #   @param display_phone_number [String] Display phone number.
        #
        #   @param payment_status [Zavudev::Models::Sender::Whatsapp::PaymentStatus] Payment configuration status from Meta.
        #
        #   @param phone_number_id [String] WhatsApp phone number ID from Meta.

        # @see Zavudev::Models::Sender::Whatsapp#payment_status
        class PaymentStatus < Zavudev::Internal::Type::BaseModel
          # @!attribute can_send_templates
          #   Whether template messages can be sent. Requires setupStatus=COMPLETE and
          #   methodStatus=VALID.
          #
          #   @return [Boolean, nil]
          optional :can_send_templates, Zavudev::Internal::Type::Boolean, api_name: :canSendTemplates

          # @!attribute method_status
          #   Payment method status (VALID, NONE, etc.).
          #
          #   @return [String, nil]
          optional :method_status, String, api_name: :methodStatus

          # @!attribute setup_status
          #   Payment setup status (COMPLETE, NOT_STARTED, etc.).
          #
          #   @return [String, nil]
          optional :setup_status, String, api_name: :setupStatus

          # @!method initialize(can_send_templates: nil, method_status: nil, setup_status: nil)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::Sender::Whatsapp::PaymentStatus} for more details.
          #
          #   Payment configuration status from Meta.
          #
          #   @param can_send_templates [Boolean] Whether template messages can be sent. Requires setupStatus=COMPLETE and methodS
          #
          #   @param method_status [String] Payment method status (VALID, NONE, etc.).
          #
          #   @param setup_status [String] Payment setup status (COMPLETE, NOT_STARTED, etc.).
        end
      end
    end
  end
end
