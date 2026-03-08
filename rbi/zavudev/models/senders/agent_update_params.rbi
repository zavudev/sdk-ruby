# typed: strong

module Zavudev
  module Models
    module Senders
      class AgentUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Senders::AgentUpdateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :sender_id

        sig { returns(T.nilable(String)) }
        attr_reader :api_key

        sig { params(api_key: String).void }
        attr_writer :api_key

        sig { returns(T.nilable(Integer)) }
        attr_reader :context_window_messages

        sig { params(context_window_messages: Integer).void }
        attr_writer :context_window_messages

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_contact_metadata

        sig { params(include_contact_metadata: T::Boolean).void }
        attr_writer :include_contact_metadata

        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_tokens

        sig { returns(T.nilable(String)) }
        attr_reader :model

        sig { params(model: String).void }
        attr_writer :model

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # LLM provider for the AI agent.
        sig { returns(T.nilable(Zavudev::Senders::AgentProvider::OrSymbol)) }
        attr_reader :provider

        sig { params(provider: Zavudev::Senders::AgentProvider::OrSymbol).void }
        attr_writer :provider

        sig { returns(T.nilable(String)) }
        attr_reader :system_prompt

        sig { params(system_prompt: String).void }
        attr_writer :system_prompt

        sig { returns(T.nilable(Float)) }
        attr_accessor :temperature

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
            api_key: String,
            context_window_messages: Integer,
            enabled: T::Boolean,
            include_contact_metadata: T::Boolean,
            max_tokens: T.nilable(Integer),
            model: String,
            name: String,
            provider: Zavudev::Senders::AgentProvider::OrSymbol,
            system_prompt: String,
            temperature: T.nilable(Float),
            trigger_on_channels: T::Array[String],
            trigger_on_message_types: T::Array[String],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          sender_id:,
          api_key: nil,
          context_window_messages: nil,
          enabled: nil,
          include_contact_metadata: nil,
          max_tokens: nil,
          model: nil,
          name: nil,
          # LLM provider for the AI agent.
          provider: nil,
          system_prompt: nil,
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
              api_key: String,
              context_window_messages: Integer,
              enabled: T::Boolean,
              include_contact_metadata: T::Boolean,
              max_tokens: T.nilable(Integer),
              model: String,
              name: String,
              provider: Zavudev::Senders::AgentProvider::OrSymbol,
              system_prompt: String,
              temperature: T.nilable(Float),
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
