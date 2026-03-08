# typed: strong

module Zavudev
  module Resources
    class Senders
      class Agent
        sig { returns(Zavudev::Resources::Senders::Agent::Executions) }
        attr_reader :executions

        sig { returns(Zavudev::Resources::Senders::Agent::Flows) }
        attr_reader :flows

        sig { returns(Zavudev::Resources::Senders::Agent::Tools) }
        attr_reader :tools

        sig { returns(Zavudev::Resources::Senders::Agent::KnowledgeBases) }
        attr_reader :knowledge_bases

        # Create an AI agent for a sender. Each sender can have at most one agent.
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
          ).returns(Zavudev::Senders::AgentResponse)
        end
        def create(
          sender_id,
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

        # Get the AI agent configuration for a sender.
        sig do
          params(
            sender_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Senders::AgentResponse)
        end
        def retrieve(sender_id, request_options: {})
        end

        # Update an AI agent's configuration.
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
          ).returns(Zavudev::Senders::AgentResponse)
        end
        def update(
          sender_id,
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

        # Delete an AI agent.
        sig do
          params(
            sender_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def delete(sender_id, request_options: {})
        end

        # Get statistics for an AI agent including invocations, tokens, and costs.
        sig do
          params(
            sender_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Senders::AgentStats)
        end
        def stats(sender_id, request_options: {})
        end

        # @api private
        sig { params(client: Zavudev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
