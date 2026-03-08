# typed: strong

module Zavudev
  module Models
    class Sender < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::Sender, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :name

      # Phone number in E.164 format.
      sig { returns(String) }
      attr_accessor :phone_number

      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Whether inbound email receiving is enabled for this sender.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :email_receiving_enabled

      sig { params(email_receiving_enabled: T::Boolean).void }
      attr_writer :email_receiving_enabled

      # Whether this sender is the project's default.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_default

      sig { params(is_default: T::Boolean).void }
      attr_writer :is_default

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # Webhook configuration for the sender.
      sig { returns(T.nilable(Zavudev::SenderWebhook)) }
      attr_reader :webhook

      sig { params(webhook: Zavudev::SenderWebhook::OrHash).void }
      attr_writer :webhook

      # WhatsApp Business Account information. Only present if a WABA is connected.
      sig { returns(T.nilable(Zavudev::Sender::Whatsapp)) }
      attr_reader :whatsapp

      sig { params(whatsapp: Zavudev::Sender::Whatsapp::OrHash).void }
      attr_writer :whatsapp

      sig do
        params(
          id: String,
          name: String,
          phone_number: String,
          created_at: Time,
          email_receiving_enabled: T::Boolean,
          is_default: T::Boolean,
          updated_at: Time,
          webhook: Zavudev::SenderWebhook::OrHash,
          whatsapp: Zavudev::Sender::Whatsapp::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        # Phone number in E.164 format.
        phone_number:,
        created_at: nil,
        # Whether inbound email receiving is enabled for this sender.
        email_receiving_enabled: nil,
        # Whether this sender is the project's default.
        is_default: nil,
        updated_at: nil,
        # Webhook configuration for the sender.
        webhook: nil,
        # WhatsApp Business Account information. Only present if a WABA is connected.
        whatsapp: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            phone_number: String,
            created_at: Time,
            email_receiving_enabled: T::Boolean,
            is_default: T::Boolean,
            updated_at: Time,
            webhook: Zavudev::SenderWebhook,
            whatsapp: Zavudev::Sender::Whatsapp
          }
        )
      end
      def to_hash
      end

      class Whatsapp < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Sender::Whatsapp, Zavudev::Internal::AnyHash)
          end

        # Display phone number.
        sig { returns(T.nilable(String)) }
        attr_reader :display_phone_number

        sig { params(display_phone_number: String).void }
        attr_writer :display_phone_number

        # Payment configuration status from Meta.
        sig { returns(T.nilable(Zavudev::Sender::Whatsapp::PaymentStatus)) }
        attr_reader :payment_status

        sig do
          params(
            payment_status: Zavudev::Sender::Whatsapp::PaymentStatus::OrHash
          ).void
        end
        attr_writer :payment_status

        # WhatsApp phone number ID from Meta.
        sig { returns(T.nilable(String)) }
        attr_reader :phone_number_id

        sig { params(phone_number_id: String).void }
        attr_writer :phone_number_id

        # WhatsApp Business Account information. Only present if a WABA is connected.
        sig do
          params(
            display_phone_number: String,
            payment_status: Zavudev::Sender::Whatsapp::PaymentStatus::OrHash,
            phone_number_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Display phone number.
          display_phone_number: nil,
          # Payment configuration status from Meta.
          payment_status: nil,
          # WhatsApp phone number ID from Meta.
          phone_number_id: nil
        )
        end

        sig do
          override.returns(
            {
              display_phone_number: String,
              payment_status: Zavudev::Sender::Whatsapp::PaymentStatus,
              phone_number_id: String
            }
          )
        end
        def to_hash
        end

        class PaymentStatus < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Sender::Whatsapp::PaymentStatus,
                Zavudev::Internal::AnyHash
              )
            end

          # Whether template messages can be sent. Requires setupStatus=COMPLETE and
          # methodStatus=VALID.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :can_send_templates

          sig { params(can_send_templates: T::Boolean).void }
          attr_writer :can_send_templates

          # Payment method status (VALID, NONE, etc.).
          sig { returns(T.nilable(String)) }
          attr_reader :method_status

          sig { params(method_status: String).void }
          attr_writer :method_status

          # Payment setup status (COMPLETE, NOT_STARTED, etc.).
          sig { returns(T.nilable(String)) }
          attr_reader :setup_status

          sig { params(setup_status: String).void }
          attr_writer :setup_status

          # Payment configuration status from Meta.
          sig do
            params(
              can_send_templates: T::Boolean,
              method_status: String,
              setup_status: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether template messages can be sent. Requires setupStatus=COMPLETE and
            # methodStatus=VALID.
            can_send_templates: nil,
            # Payment method status (VALID, NONE, etc.).
            method_status: nil,
            # Payment setup status (COMPLETE, NOT_STARTED, etc.).
            setup_status: nil
          )
          end

          sig do
            override.returns(
              {
                can_send_templates: T::Boolean,
                method_status: String,
                setup_status: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
