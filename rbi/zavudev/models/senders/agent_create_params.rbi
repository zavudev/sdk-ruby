# typed: strong

module Zavudev
  module Models
    module Senders
      class AgentCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Senders::AgentCreateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :sender_id

        sig { returns(String) }
        attr_accessor :model

        sig { returns(String) }
        attr_accessor :name

        # LLM provider for the AI agent.
        sig { returns(Zavudev::Senders::AgentProvider::OrSymbol) }
        attr_accessor :provider

        sig { returns(String) }
        attr_accessor :system_prompt

        # API key for the LLM provider. Required unless provider is 'zavu'.
        sig { returns(T.nilable(String)) }
        attr_reader :api_key

        sig { params(api_key: String).void }
        attr_writer :api_key

        sig { returns(T.nilable(Integer)) }
        attr_reader :context_window_messages

        sig { params(context_window_messages: Integer).void }
        attr_writer :context_window_messages

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_contact_metadata

        sig { params(include_contact_metadata: T::Boolean).void }
        attr_writer :include_contact_metadata

        sig { returns(T.nilable(Integer)) }
        attr_reader :max_tokens

        sig { params(max_tokens: Integer).void }
        attr_writer :max_tokens

        sig { returns(T.nilable(Float)) }
        attr_reader :temperature

        sig { params(temperature: Float).void }
        attr_writer :temperature

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :trigger_on_channels

        sig { params(trigger_on_channels: T::Array[String]).void }
        attr_writer :trigger_on_channels

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :trigger_on_message_types

        sig { params(trigger_on_message_types: T::Array[String]).void }
        attr_writer :trigger_on_message_types

        sig do
          params(
            sender_id: String,
            model: String,
            name: String,
            provider: Zavudev::Senders::AgentProvider::OrSymbol,
            system_prompt: String,
            api_key: String,
            context_window_messages: Integer,
            include_contact_metadata: T::Boolean,
            max_tokens: Integer,
            temperature: Float,
            trigger_on_channels: T::Array[String],
            trigger_on_message_types: T::Array[String],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          sender_id:,
          model:,
          name:,
          # LLM provider for the AI agent.
          provider:,
          system_prompt:,
          # API key for the LLM provider. Required unless provider is 'zavu'.
          api_key: nil,
          context_window_messages: nil,
          include_contact_metadata: nil,
          max_tokens: nil,
          temperature: nil,
          trigger_on_channels: nil,
          trigger_on_message_types: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              sender_id: String,
              model: String,
              name: String,
              provider: Zavudev::Senders::AgentProvider::OrSymbol,
              system_prompt: String,
              api_key: String,
              context_window_messages: Integer,
              include_contact_metadata: T::Boolean,
              max_tokens: Integer,
              temperature: Float,
              trigger_on_channels: T::Array[String],
              trigger_on_message_types: T::Array[String],
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
