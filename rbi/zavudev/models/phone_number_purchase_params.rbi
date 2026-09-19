# typed: strong

module Zavudev
  module Models
    class PhoneNumberPurchaseParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::PhoneNumberPurchaseParams, Zavudev::Internal::AnyHash)
        end

      # Phone number in E.164 format.
      sig { returns(String) }
      attr_accessor :phone_number

      # Optional custom name for the phone number.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Regulatory information, for numbers whose requirements list is not empty. Get
      # the list with `GET /v1/phone-numbers/requirements?phoneNumber=...` and send one
      # entry per requirement id, except `action` requirements, which take no value.
      # Every required id must be present, once, and no unknown id may be sent;
      # otherwise the purchase is refused with `400 invalid_request` before anything is
      # charged.
      #
      # The information is kept for your project under the number's country and `type`.
      # A later purchase there may omit this field if what is kept still covers that
      # number's requirements. Omit it for numbers without requirements.
      sig do
        returns(
          T.nilable(
            T::Array[Zavudev::PhoneNumberPurchaseParams::RegulatoryRequirement]
          )
        )
      end
      attr_reader :regulatory_requirements

      sig do
        params(
          regulatory_requirements:
            T::Array[
              Zavudev::PhoneNumberPurchaseParams::RegulatoryRequirement::OrHash
            ]
        ).void
      end
      attr_writer :regulatory_requirements

      # Type of phone number. `mobile` is stocked in countries where no geographic
      # (`local`) or non-geographic (`national`) inventory exists, and in several
      # markets it is the only type that can receive SMS.
      sig { returns(T.nilable(Zavudev::PhoneNumberType::OrSymbol)) }
      attr_reader :type

      sig { params(type: Zavudev::PhoneNumberType::OrSymbol).void }
      attr_writer :type

      sig do
        params(
          phone_number: String,
          name: String,
          regulatory_requirements:
            T::Array[
              Zavudev::PhoneNumberPurchaseParams::RegulatoryRequirement::OrHash
            ],
          type: Zavudev::PhoneNumberType::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Phone number in E.164 format.
        phone_number:,
        # Optional custom name for the phone number.
        name: nil,
        # Regulatory information, for numbers whose requirements list is not empty. Get
        # the list with `GET /v1/phone-numbers/requirements?phoneNumber=...` and send one
        # entry per requirement id, except `action` requirements, which take no value.
        # Every required id must be present, once, and no unknown id may be sent;
        # otherwise the purchase is refused with `400 invalid_request` before anything is
        # charged.
        #
        # The information is kept for your project under the number's country and `type`.
        # A later purchase there may omit this field if what is kept still covers that
        # number's requirements. Omit it for numbers without requirements.
        regulatory_requirements: nil,
        # Type of phone number. `mobile` is stocked in countries where no geographic
        # (`local`) or non-geographic (`national`) inventory exists, and in several
        # markets it is the only type that can receive SMS.
        type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            phone_number: String,
            name: String,
            regulatory_requirements:
              T::Array[
                Zavudev::PhoneNumberPurchaseParams::RegulatoryRequirement
              ],
            type: Zavudev::PhoneNumberType::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class RegulatoryRequirement < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::PhoneNumberPurchaseParams::RegulatoryRequirement,
              Zavudev::Internal::AnyHash
            )
          end

        # Depends on the requirement's `type`: the text itself for `textual`; for
        # `address`, the `id` of an address created in this project with
        # `POST /v1/addresses`; for `document`, the `id` of a document created with
        # `POST /v1/documents`. An address or document from another project, or one
        # rejected in review, is refused.
        sig { returns(String) }
        attr_accessor :field_value

        # A `requirementTypes[].id` from `GET /v1/phone-numbers/requirements`. Each id may
        # appear only once.
        sig { returns(String) }
        attr_accessor :requirement_type

        sig do
          params(field_value: String, requirement_type: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Depends on the requirement's `type`: the text itself for `textual`; for
          # `address`, the `id` of an address created in this project with
          # `POST /v1/addresses`; for `document`, the `id` of a document created with
          # `POST /v1/documents`. An address or document from another project, or one
          # rejected in review, is refused.
          field_value:,
          # A `requirementTypes[].id` from `GET /v1/phone-numbers/requirements`. Each id may
          # appear only once.
          requirement_type:
        )
        end

        sig do
          override.returns({ field_value: String, requirement_type: String })
        end
        def to_hash
        end
      end
    end
  end
end
