# typed: strong

module Zavudev
  module Models
    class AgentTestParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::AgentTestParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :agent_id

      # What to say to the agent.
      sig { returns(String) }
      attr_accessor :message

      # Run the tools the agent calls instead of reporting the choice and stopping.
      #
      # Off by default because a tool handler talks to the outside world: a rehearsal
      # that charges a card is not a rehearsal. Turn it on to exercise the loop that
      # actually matters — the model picks a tool, the handler answers, the model
      # replies with the result — without sending a message to anyone. What ran comes
      # back in `executedToolCalls`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :execute_tools

      sig { params(execute_tools: T::Boolean).void }
      attr_writer :execute_tools

      # Prior turns, oldest first, to exercise multi-turn behaviour without persisting a
      # thread. Trimmed to the agent's context window.
      sig { returns(T.nilable(T::Array[Zavudev::AgentTestParams::History])) }
      attr_reader :history

      sig do
        params(
          history: T::Array[Zavudev::AgentTestParams::History::OrHash]
        ).void
      end
      attr_writer :history

      # Set false to skip retrieval and isolate prompt behaviour from the knowledge
      # base.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :use_knowledge_base

      sig { params(use_knowledge_base: T::Boolean).void }
      attr_writer :use_knowledge_base

      sig do
        params(
          agent_id: String,
          message: String,
          execute_tools: T::Boolean,
          history: T::Array[Zavudev::AgentTestParams::History::OrHash],
          use_knowledge_base: T::Boolean,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        agent_id:,
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

      sig do
        override.returns(
          {
            agent_id: String,
            message: String,
            execute_tools: T::Boolean,
            history: T::Array[Zavudev::AgentTestParams::History],
            use_knowledge_base: T::Boolean,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class History < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::AgentTestParams::History, Zavudev::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :content

        sig { returns(Zavudev::AgentTestParams::History::Role::OrSymbol) }
        attr_accessor :role

        sig do
          params(
            content: String,
            role: Zavudev::AgentTestParams::History::Role::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(content:, role:)
        end

        sig do
          override.returns(
            {
              content: String,
              role: Zavudev::AgentTestParams::History::Role::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Role
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::AgentTestParams::History::Role)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER =
            T.let(:user, Zavudev::AgentTestParams::History::Role::TaggedSymbol)
          ASSISTANT =
            T.let(
              :assistant,
              Zavudev::AgentTestParams::History::Role::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Zavudev::AgentTestParams::History::Role::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
