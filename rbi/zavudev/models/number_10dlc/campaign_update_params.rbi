# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class CampaignUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Number10dlc::CampaignUpdateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :campaign_id

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(String)) }
        attr_reader :help_message

        sig { params(help_message: String).void }
        attr_writer :help_message

        sig { returns(T.nilable(String)) }
        attr_reader :message_flow

        sig { params(message_flow: String).void }
        attr_writer :message_flow

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :opt_in_keywords

        sig { params(opt_in_keywords: T::Array[String]).void }
        attr_writer :opt_in_keywords

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :opt_out_keywords

        sig { params(opt_out_keywords: T::Array[String]).void }
        attr_writer :opt_out_keywords

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :sample_messages

        sig { params(sample_messages: T::Array[String]).void }
        attr_writer :sample_messages

        sig do
          params(
            campaign_id: String,
            description: String,
            help_message: String,
            message_flow: String,
            name: String,
            opt_in_keywords: T::Array[String],
            opt_out_keywords: T::Array[String],
            sample_messages: T::Array[String],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          campaign_id:,
          description: nil,
          help_message: nil,
          message_flow: nil,
          name: nil,
          opt_in_keywords: nil,
          opt_out_keywords: nil,
          sample_messages: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              campaign_id: String,
              description: String,
              help_message: String,
              message_flow: String,
              name: String,
              opt_in_keywords: T::Array[String],
              opt_out_keywords: T::Array[String],
              sample_messages: T::Array[String],
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
