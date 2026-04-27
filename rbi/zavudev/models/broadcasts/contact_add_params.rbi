# typed: strong

module Zavudev
  module Models
    module Broadcasts
      class ContactAddParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Broadcasts::ContactAddParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :broadcast_id

        # List of contacts to add (max 1000 per request).
        sig do
          returns(T::Array[Zavudev::Broadcasts::ContactAddParams::Contact])
        end
        attr_accessor :contacts

        sig do
          params(
            broadcast_id: String,
            contacts:
              T::Array[Zavudev::Broadcasts::ContactAddParams::Contact::OrHash],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          broadcast_id:,
          # List of contacts to add (max 1000 per request).
          contacts:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              broadcast_id: String,
              contacts:
                T::Array[Zavudev::Broadcasts::ContactAddParams::Contact],
              request_options: Zavudev::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Contact < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Broadcasts::ContactAddParams::Contact,
                Zavudev::Internal::AnyHash
              )
            end

          # Phone number (E.164) or email address.
          sig { returns(String) }
          attr_accessor :recipient

          # Per-contact button variables for dynamic URL/OTP buttons. Keys are the button
          # index (0, 1, 2).
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :template_button_variables

          sig do
            params(template_button_variables: T::Hash[Symbol, String]).void
          end
          attr_writer :template_button_variables

          # Per-contact body variables. Keys are positions (1, 2, ...) matching the order
          # placeholders appear in the template body.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :template_variables

          sig { params(template_variables: T::Hash[Symbol, String]).void }
          attr_writer :template_variables

          sig do
            params(
              recipient: String,
              template_button_variables: T::Hash[Symbol, String],
              template_variables: T::Hash[Symbol, String]
            ).returns(T.attached_class)
          end
          def self.new(
            # Phone number (E.164) or email address.
            recipient:,
            # Per-contact button variables for dynamic URL/OTP buttons. Keys are the button
            # index (0, 1, 2).
            template_button_variables: nil,
            # Per-contact body variables. Keys are positions (1, 2, ...) matching the order
            # placeholders appear in the template body.
            template_variables: nil
          )
          end

          sig do
            override.returns(
              {
                recipient: String,
                template_button_variables: T::Hash[Symbol, String],
                template_variables: T::Hash[Symbol, String]
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
