# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class CampaignCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Number10dlc::CampaignCreateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :affiliate_marketing

        sig { returns(T::Boolean) }
        attr_accessor :age_gated

        # ID of the brand to create this campaign under.
        sig { returns(String) }
        attr_accessor :brand_id

        sig { returns(String) }
        attr_accessor :description

        sig { returns(T::Boolean) }
        attr_accessor :direct_lending

        sig { returns(T::Boolean) }
        attr_accessor :embedded_link

        sig { returns(T::Boolean) }
        attr_accessor :embedded_phone

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T::Boolean) }
        attr_accessor :number_pooling

        sig { returns(T::Array[String]) }
        attr_accessor :sample_messages

        sig { returns(T::Boolean) }
        attr_accessor :subscriber_help

        sig { returns(T::Boolean) }
        attr_accessor :subscriber_opt_in

        sig { returns(T::Boolean) }
        attr_accessor :subscriber_opt_out

        # Campaign use case (e.g., ACCOUNT_NOTIFICATION, MARKETING, 2FA).
        sig { returns(String) }
        attr_accessor :use_case

        sig { returns(T.nilable(String)) }
        attr_reader :help_message

        sig { params(help_message: String).void }
        attr_writer :help_message

        sig { returns(T.nilable(String)) }
        attr_reader :message_flow

        sig { params(message_flow: String).void }
        attr_writer :message_flow

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :opt_in_keywords

        sig { params(opt_in_keywords: T::Array[String]).void }
        attr_writer :opt_in_keywords

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :opt_out_keywords

        sig { params(opt_out_keywords: T::Array[String]).void }
        attr_writer :opt_out_keywords

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :sub_use_cases

        sig { params(sub_use_cases: T::Array[String]).void }
        attr_writer :sub_use_cases

        sig do
          params(
            affiliate_marketing: T::Boolean,
            age_gated: T::Boolean,
            brand_id: String,
            description: String,
            direct_lending: T::Boolean,
            embedded_link: T::Boolean,
            embedded_phone: T::Boolean,
            name: String,
            number_pooling: T::Boolean,
            sample_messages: T::Array[String],
            subscriber_help: T::Boolean,
            subscriber_opt_in: T::Boolean,
            subscriber_opt_out: T::Boolean,
            use_case: String,
            help_message: String,
            message_flow: String,
            opt_in_keywords: T::Array[String],
            opt_out_keywords: T::Array[String],
            sub_use_cases: T::Array[String],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          affiliate_marketing:,
          age_gated:,
          # ID of the brand to create this campaign under.
          brand_id:,
          description:,
          direct_lending:,
          embedded_link:,
          embedded_phone:,
          name:,
          number_pooling:,
          sample_messages:,
          subscriber_help:,
          subscriber_opt_in:,
          subscriber_opt_out:,
          # Campaign use case (e.g., ACCOUNT_NOTIFICATION, MARKETING, 2FA).
          use_case:,
          help_message: nil,
          message_flow: nil,
          opt_in_keywords: nil,
          opt_out_keywords: nil,
          sub_use_cases: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              affiliate_marketing: T::Boolean,
              age_gated: T::Boolean,
              brand_id: String,
              description: String,
              direct_lending: T::Boolean,
              embedded_link: T::Boolean,
              embedded_phone: T::Boolean,
              name: String,
              number_pooling: T::Boolean,
              sample_messages: T::Array[String],
              subscriber_help: T::Boolean,
              subscriber_opt_in: T::Boolean,
              subscriber_opt_out: T::Boolean,
              use_case: String,
              help_message: String,
              message_flow: String,
              opt_in_keywords: T::Array[String],
              opt_out_keywords: T::Array[String],
              sub_use_cases: T::Array[String],
              request_options: Zavudev::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
