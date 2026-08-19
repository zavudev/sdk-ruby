# typed: strong

module Zavudev
  module Resources
    class Agents
      sig { returns(Zavudev::Resources::Agents::Senders) }
      attr_reader :senders

      # Create an agent without a sender. It is created disabled; connect a sender and
      # enable it when you are ready for it to answer.
      #
      # **Sub-resources.** An agent's tools, flows and knowledge bases are reachable at
      # `/v1/agents/{agentId}/tools`, `/v1/agents/{agentId}/flows` and
      # `/v1/agents/{agentId}/knowledge-bases`, mirroring the sender-scoped routes
      # documented under `/v1/senders/{senderId}/agent/...` exactly. Use the
      # agent-scoped form while the agent has no sender: the sender-scoped one cannot
      # address it.
      sig do
        params(
          model: String,
          name: String,
          provider: Zavudev::Senders::AgentProvider::OrSymbol,
          system_prompt: String,
          context_window_messages: Integer,
          include_contact_metadata: T::Boolean,
          max_tokens: Integer,
          temperature: Float,
          trigger_on_channels: T::Array[String],
          trigger_on_message_types: T::Array[String],
          voice: Zavudev::AgentCreateParams::Voice::OrHash,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::AgentCreateResponse)
      end
      def create(
        model:,
        name:,
        # LLM provider for the AI agent.
        provider:,
        system_prompt:,
        context_window_messages: nil,
        include_contact_metadata: nil,
        max_tokens: nil,
        temperature: nil,
        trigger_on_channels: nil,
        trigger_on_message_types: nil,
        # Voice Agent configuration on a sender's AI agent. Controls how the agent behaves
        # on inbound and outbound phone calls through Zavu's managed voice pipeline
        # (speech recognition, the agent's LLM, and speech synthesis, with real-time
        # interruption handling). Requires the Voice Agents feature to be enabled for your
        # team.
        voice: nil,
        request_options: {}
      )
      end

      # Get an agent
      sig do
        params(
          agent_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::AgentRetrieveResponse)
      end
      def retrieve(
        # Agent ID.
        agent_id,
        request_options: {}
      )
      end

      # Update an agent
      sig do
        params(
          agent_id: String,
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
          voice: Zavudev::AgentUpdateParams::Voice::OrHash,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::AgentUpdateResponse)
      end
      def update(
        # Agent ID.
        agent_id,
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
        # Voice Agent configuration. Patch this object to enable voice, change the
        # greeting, or adjust call limits. Requires the Voice Agents feature to be enabled
        # for your team.
        voice: nil,
        request_options: {}
      )
      end

      # Every agent in the project, newest first — including agents that are not
      # connected to any sender yet, which the sender-scoped routes cannot reach. Each
      # item carries `senderIds`, the senders the agent answers on.
      sig do
        params(
          cursor: String,
          limit: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Senders::SendersAgent])
      end
      def list(cursor: nil, limit: nil, request_options: {})
      end

      # Delete an agent
      sig do
        params(
          agent_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Agent ID.
        agent_id,
        request_options: {}
      )
      end

      # The voices an agent can speak with, for `voice.ttsVoiceId`. Filter by `language`
      # to get the ones that speak it; a voice can still be used with `language: auto`,
      # where the agent follows the caller and keeps the chosen voice.
      sig do
        params(
          language: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::AgentListVoicesResponse)
      end
      def list_voices(
        # BCP-47 tag (`en`, `es`, `pt-BR`). Omit, or pass `auto`, for every voice.
        language: nil,
        request_options: {}
      )
      end

      # Run the agent's prompt, model and knowledge base against a message and return
      # the reply instead of delivering it. Writes nothing and charges nothing, so it is
      # safe to call repeatedly while iterating on a prompt.
      #
      # Note that a dry run never **executes** tools — running them would cause real
      # side effects. Live conversations on every channel do call them. When the agent
      # has enabled tools, that gap is reported in `warnings` rather than silently
      # producing an answer that looks like a tool call happened.
      sig do
        params(
          agent_id: String,
          message: String,
          execute_tools: T::Boolean,
          history: T::Array[Zavudev::AgentTestParams::History::OrHash],
          use_knowledge_base: T::Boolean,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::AgentTestResponse)
      end
      def test_(
        # Agent ID.
        agent_id,
        # What to say to the agent.
        message:,
        # Run the tools the agent calls instead of reporting the choice and stopping.
        #
        # Off by default because a tool handler talks to the outside world: a rehearsal
        # that charges a card is not a rehearsal. Turn it on to exercise the loop that
        # actually matters — the model picks a tool, the handler answers, the model
        # replies with the result — without sending a message to anyone. What ran comes
        # back in `executedToolCalls`.
        execute_tools: nil,
        # Prior turns, oldest first, to exercise multi-turn behaviour without persisting a
        # thread. Trimmed to the agent's context window.
        history: nil,
        # Set false to skip retrieval and isolate prompt behaviour from the knowledge
        # base.
        use_knowledge_base: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
