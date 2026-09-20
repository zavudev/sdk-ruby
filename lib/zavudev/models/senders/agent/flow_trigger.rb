# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        class FlowTrigger < Zavudev::Internal::Type::BaseModel
          # @!attribute type
          #   What starts a flow.
          #
          #   - `keyword`: the message contains one of the words listed in `keywords`. Plain
          #     substring matching, so a word inside another word still counts.
          #   - `intent`: the message MEANS what `intent` describes, whatever words it uses.
          #   - `always`: any message starts it.
          #   - `manual`: reserved. Nothing starts a `manual` flow today — it is accepted and
          #     stored, and no message or endpoint runs it.
          #
          #   @return [Symbol, Zavudev::Models::Senders::Agent::FlowTrigger::Type]
          required :type, enum: -> { Zavudev::Senders::Agent::FlowTrigger::Type }

          # @!attribute intent
          #   One plain sentence describing what the contact wants, for `intent` triggers. Any
          #   language.
          #
          #   The message is judged for meaning, not for words, so "kiero saber el presio"
          #   starts a flow whose intent is "quiere saber precios o cotizar", and "no quiero
          #   info de precios" starts nothing.
          #
          #   A `keyword` or `always` flow with a higher `priority` is matched first and wins.
          #   At most 12 intent flows are considered per message, highest priority first. When
          #   the classification is unavailable or uncertain, the message is handled as if no
          #   intent matched, so a flow never starts on a guess.
          #
          #   @return [String, nil]
          optional :intent, String

          # @!attribute keywords
          #   Words that start the flow, for `keyword` triggers. Matched as substrings,
          #   case-insensitively, against the whole message: a flow on `info` also starts on
          #   "no quiero info". Use `intent` when that matters.
          #
          #   @return [Array<String>, nil]
          optional :keywords, Zavudev::Internal::Type::ArrayOf[String]

          # @!method initialize(type:, intent: nil, keywords: nil)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::Senders::Agent::FlowTrigger} for more details.
          #
          #   @param type [Symbol, Zavudev::Models::Senders::Agent::FlowTrigger::Type] What starts a flow.
          #
          #   @param intent [String] One plain sentence describing what the contact wants, for `intent` triggers. Any
          #
          #   @param keywords [Array<String>] Words that start the flow, for `keyword` triggers. Matched as substrings, case-i

          # What starts a flow.
          #
          # - `keyword`: the message contains one of the words listed in `keywords`. Plain
          #   substring matching, so a word inside another word still counts.
          # - `intent`: the message MEANS what `intent` describes, whatever words it uses.
          # - `always`: any message starts it.
          # - `manual`: reserved. Nothing starts a `manual` flow today — it is accepted and
          #   stored, and no message or endpoint runs it.
          #
          # @see Zavudev::Models::Senders::Agent::FlowTrigger#type
          module Type
            extend Zavudev::Internal::Type::Enum

            KEYWORD = :keyword
            INTENT = :intent
            ALWAYS = :always
            MANUAL = :manual

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
