# typed: strong

module Zavudev
  module Models
    class AgentTestResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::Models::AgentTestResponse, Zavudev::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :error

      sig { returns(Integer) }
      attr_accessor :input_tokens

      # Knowledge-base chunks retrieved for this message. Zero means the answer was not
      # grounded in your documents.
      sig { returns(Integer) }
      attr_accessor :knowledge_chunks_used

      sig { returns(Integer) }
      attr_accessor :latency_ms

      sig { returns(Integer) }
      attr_accessor :output_tokens

      sig { returns(T::Boolean) }
      attr_accessor :success

      # What the agent would reply.
      sig { returns(T.nilable(String)) }
      attr_accessor :text

      # Things that are true of this agent but that a dry run cannot prove. Surfaced so
      # a passing dry run is never mistaken for proof that the agent works live.
      #
      # - The agent being disabled.
      # - Enabled tools that were **not offered to the model** here — the model never
      #   saw them, so a reply that looks like a lookup was invented. Live conversations
      #   on every channel do offer them; running them here would cause real side
      #   effects.
      # - An agent whose sender has none of the channels it triggers on, which answers
      #   every dry run and no real message.
      # - Contact metadata that exists on a real conversation but not here.
      sig { returns(T::Array[String]) }
      attr_accessor :warnings

      # Tools that actually ran, in order, when the request set `executeTools`. Empty on
      # a normal dry run, where nothing is executed. An entry with `ok: false` means the
      # agent saw an error and answered around it, which is what a customer would have
      # received.
      sig do
        returns(
          T.nilable(
            T::Array[Zavudev::Models::AgentTestResponse::ExecutedToolCall]
          )
        )
      end
      attr_reader :executed_tool_calls

      sig do
        params(
          executed_tool_calls:
            T::Array[
              Zavudev::Models::AgentTestResponse::ExecutedToolCall::OrHash
            ]
        ).void
      end
      attr_writer :executed_tool_calls

      sig do
        params(
          error: T.nilable(String),
          input_tokens: Integer,
          knowledge_chunks_used: Integer,
          latency_ms: Integer,
          output_tokens: Integer,
          success: T::Boolean,
          text: T.nilable(String),
          warnings: T::Array[String],
          executed_tool_calls:
            T::Array[
              Zavudev::Models::AgentTestResponse::ExecutedToolCall::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        error:,
        input_tokens:,
        # Knowledge-base chunks retrieved for this message. Zero means the answer was not
        # grounded in your documents.
        knowledge_chunks_used:,
        latency_ms:,
        output_tokens:,
        success:,
        # What the agent would reply.
        text:,
        # Things that are true of this agent but that a dry run cannot prove. Surfaced so
        # a passing dry run is never mistaken for proof that the agent works live.
        #
        # - The agent being disabled.
        # - Enabled tools that were **not offered to the model** here — the model never
        #   saw them, so a reply that looks like a lookup was invented. Live conversations
        #   on every channel do offer them; running them here would cause real side
        #   effects.
        # - An agent whose sender has none of the channels it triggers on, which answers
        #   every dry run and no real message.
        # - Contact metadata that exists on a real conversation but not here.
        warnings:,
        # Tools that actually ran, in order, when the request set `executeTools`. Empty on
        # a normal dry run, where nothing is executed. An entry with `ok: false` means the
        # agent saw an error and answered around it, which is what a customer would have
        # received.
        executed_tool_calls: nil
      )
      end

      sig do
        override.returns(
          {
            error: T.nilable(String),
            input_tokens: Integer,
            knowledge_chunks_used: Integer,
            latency_ms: Integer,
            output_tokens: Integer,
            success: T::Boolean,
            text: T.nilable(String),
            warnings: T::Array[String],
            executed_tool_calls:
              T::Array[Zavudev::Models::AgentTestResponse::ExecutedToolCall]
          }
        )
      end
      def to_hash
      end

      class ExecutedToolCall < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::AgentTestResponse::ExecutedToolCall,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T::Boolean) }
        attr_accessor :ok

        sig { returns(T.nilable(String)) }
        attr_accessor :error

        sig do
          params(
            name: String,
            ok: T::Boolean,
            error: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(name:, ok:, error: nil)
        end

        sig do
          override.returns(
            { name: String, ok: T::Boolean, error: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
