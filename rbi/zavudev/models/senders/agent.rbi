# typed: strong

module Zavudev
  module Models
    module Senders
      class SendersAgent < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Senders::SendersAgent, Zavudev::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        # Whether the agent is active.
        sig { returns(T::Boolean) }
        attr_accessor :enabled

        # Model ID (e.g., gpt-4o-mini, claude-3-5-sonnet).
        sig { returns(String) }
        attr_accessor :model

        sig { returns(String) }
        attr_accessor :name

        # LLM provider for the AI agent.
        sig { returns(Zavudev::Senders::AgentProvider::TaggedSymbol) }
        attr_accessor :provider

        sig { returns(String) }
        attr_accessor :sender_id

        # System prompt for the agent.
        sig { returns(String) }
        attr_accessor :system_prompt

        sig { returns(Time) }
        attr_accessor :updated_at

        # Number of previous messages to include as context.
        sig { returns(T.nilable(Integer)) }
        attr_reader :context_window_messages

        sig { params(context_window_messages: Integer).void }
        attr_writer :context_window_messages

        # Whether to include contact metadata in context.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_contact_metadata

        sig { params(include_contact_metadata: T::Boolean).void }
        attr_writer :include_contact_metadata

        # Maximum tokens for LLM response.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_tokens

        sig { returns(T.nilable(Zavudev::Senders::SendersAgent::Stats)) }
        attr_reader :stats

        sig do
          params(stats: Zavudev::Senders::SendersAgent::Stats::OrHash).void
        end
        attr_writer :stats

        # LLM temperature (0-2).
        sig { returns(T.nilable(Float)) }
        attr_accessor :temperature

        # Channels that trigger the agent.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :trigger_on_channels

        sig { params(trigger_on_channels: T::Array[String]).void }
        attr_writer :trigger_on_channels

        # Message types that trigger the agent.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :trigger_on_message_types

        sig { params(trigger_on_message_types: T::Array[String]).void }
        attr_writer :trigger_on_message_types

        # AI Agent configuration for a sender.
        sig do
          params(
            id: String,
            created_at: Time,
            enabled: T::Boolean,
            model: String,
            name: String,
            provider: Zavudev::Senders::AgentProvider::OrSymbol,
            sender_id: String,
            system_prompt: String,
            updated_at: Time,
            context_window_messages: Integer,
            include_contact_metadata: T::Boolean,
            max_tokens: T.nilable(Integer),
            stats: Zavudev::Senders::SendersAgent::Stats::OrHash,
            temperature: T.nilable(Float),
            trigger_on_channels: T::Array[String],
            trigger_on_message_types: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          # Whether the agent is active.
          enabled:,
          # Model ID (e.g., gpt-4o-mini, claude-3-5-sonnet).
          model:,
          name:,
          # LLM provider for the AI agent.
          provider:,
          sender_id:,
          # System prompt for the agent.
          system_prompt:,
          updated_at:,
          # Number of previous messages to include as context.
          context_window_messages: nil,
          # Whether to include contact metadata in context.
          include_contact_metadata: nil,
          # Maximum tokens for LLM response.
          max_tokens: nil,
          stats: nil,
          # LLM temperature (0-2).
          temperature: nil,
          # Channels that trigger the agent.
          trigger_on_channels: nil,
          # Message types that trigger the agent.
          trigger_on_message_types: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              enabled: T::Boolean,
              model: String,
              name: String,
              provider: Zavudev::Senders::AgentProvider::TaggedSymbol,
              sender_id: String,
              system_prompt: String,
              updated_at: Time,
              context_window_messages: Integer,
              include_contact_metadata: T::Boolean,
              max_tokens: T.nilable(Integer),
              stats: Zavudev::Senders::SendersAgent::Stats,
              temperature: T.nilable(Float),
              trigger_on_channels: T::Array[String],
              trigger_on_message_types: T::Array[String]
            }
          )
        end
        def to_hash
        end

        class Stats < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::SendersAgent::Stats,
                Zavudev::Internal::AnyHash
              )
            end

          # Total cost in USD.
          sig { returns(T.nilable(Float)) }
          attr_reader :total_cost

          sig { params(total_cost: Float).void }
          attr_writer :total_cost

          sig { returns(T.nilable(Integer)) }
          attr_reader :total_invocations

          sig { params(total_invocations: Integer).void }
          attr_writer :total_invocations

          sig { returns(T.nilable(Integer)) }
          attr_reader :total_tokens_used

          sig { params(total_tokens_used: Integer).void }
          attr_writer :total_tokens_used

          sig do
            params(
              total_cost: Float,
              total_invocations: Integer,
              total_tokens_used: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Total cost in USD.
            total_cost: nil,
            total_invocations: nil,
            total_tokens_used: nil
          )
          end

          sig do
            override.returns(
              {
                total_cost: Float,
                total_invocations: Integer,
                total_tokens_used: Integer
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
