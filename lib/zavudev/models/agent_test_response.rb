# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Agents#test_
    class AgentTestResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [String, nil]
      required :error, String, nil?: true

      # @!attribute input_tokens
      #
      #   @return [Integer]
      required :input_tokens, Integer, api_name: :inputTokens

      # @!attribute knowledge_chunks_used
      #   Knowledge-base chunks retrieved for this message. Zero means the answer was not
      #   grounded in your documents.
      #
      #   @return [Integer]
      required :knowledge_chunks_used, Integer, api_name: :knowledgeChunksUsed

      # @!attribute latency_ms
      #
      #   @return [Integer]
      required :latency_ms, Integer, api_name: :latencyMs

      # @!attribute output_tokens
      #
      #   @return [Integer]
      required :output_tokens, Integer, api_name: :outputTokens

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, Zavudev::Internal::Type::Boolean

      # @!attribute text
      #   What the agent would reply.
      #
      #   @return [String, nil]
      required :text, String, nil?: true

      # @!attribute warnings
      #   Things that are true of this agent but that a dry run cannot prove. Surfaced so
      #   a passing dry run is never mistaken for proof that the agent works live.
      #
      #   - The agent being disabled.
      #   - Enabled tools that were **not offered to the model** here — the model never
      #     saw them, so a reply that looks like a lookup was invented. Live conversations
      #     on every channel do offer them; running them here would cause real side
      #     effects.
      #   - An agent whose sender has none of the channels it triggers on, which answers
      #     every dry run and no real message.
      #   - Contact metadata that exists on a real conversation but not here.
      #
      #   @return [Array<String>]
      required :warnings, Zavudev::Internal::Type::ArrayOf[String]

      # @!attribute executed_tool_calls
      #   Tools that actually ran, in order, when the request set `executeTools`. Empty on
      #   a normal dry run, where nothing is executed. An entry with `ok: false` means the
      #   agent saw an error and answered around it, which is what a customer would have
      #   received.
      #
      #   @return [Array<Zavudev::Models::AgentTestResponse::ExecutedToolCall>, nil]
      optional :executed_tool_calls,
               -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::AgentTestResponse::ExecutedToolCall] },
               api_name: :executedToolCalls

      # @!method initialize(error:, input_tokens:, knowledge_chunks_used:, latency_ms:, output_tokens:, success:, text:, warnings:, executed_tool_calls: nil)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::AgentTestResponse} for more details.
      #
      #   @param error [String, nil]
      #
      #   @param input_tokens [Integer]
      #
      #   @param knowledge_chunks_used [Integer] Knowledge-base chunks retrieved for this message. Zero means the answer was not
      #
      #   @param latency_ms [Integer]
      #
      #   @param output_tokens [Integer]
      #
      #   @param success [Boolean]
      #
      #   @param text [String, nil] What the agent would reply.
      #
      #   @param warnings [Array<String>] Things that are true of this agent but that a dry run cannot prove. Surfaced so
      #
      #   @param executed_tool_calls [Array<Zavudev::Models::AgentTestResponse::ExecutedToolCall>] Tools that actually ran, in order, when the request set `executeTools`. Empty on

      class ExecutedToolCall < Zavudev::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute ok
        #
        #   @return [Boolean]
        required :ok, Zavudev::Internal::Type::Boolean

        # @!attribute error
        #
        #   @return [String, nil]
        optional :error, String, nil?: true

        # @!method initialize(name:, ok:, error: nil)
        #   @param name [String]
        #   @param ok [Boolean]
        #   @param error [String, nil]
      end
    end
  end
end
