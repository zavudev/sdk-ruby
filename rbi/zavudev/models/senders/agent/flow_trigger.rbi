# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class FlowTrigger < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::FlowTrigger,
                Zavudev::Internal::AnyHash
              )
            end

          # What starts a flow.
          #
          # - `keyword`: the message contains one of the words listed in `keywords`. Plain
          #   substring matching, so a word inside another word still counts.
          # - `intent`: the message MEANS what `intent` describes, whatever words it uses.
          # - `always`: any message starts it.
          # - `manual`: reserved. Nothing starts a `manual` flow today — it is accepted and
          #   stored, and no message or endpoint runs it.
          sig { returns(Zavudev::Senders::Agent::FlowTrigger::Type::OrSymbol) }
          attr_accessor :type

          # One plain sentence describing what the contact wants, for `intent` triggers. Any
          # language.
          #
          # The message is judged for meaning, not for words, so "kiero saber el presio"
          # starts a flow whose intent is "quiere saber precios o cotizar", and "no quiero
          # info de precios" starts nothing.
          #
          # A `keyword` or `always` flow with a higher `priority` is matched first and wins.
          # At most 12 intent flows are considered per message, highest priority first. When
          # the classification is unavailable or uncertain, the message is handled as if no
          # intent matched, so a flow never starts on a guess.
          sig { returns(T.nilable(String)) }
          attr_reader :intent

          sig { params(intent: String).void }
          attr_writer :intent

          # Words that start the flow, for `keyword` triggers. Matched as substrings,
          # case-insensitively, against the whole message: a flow on `info` also starts on
          # "no quiero info". Use `intent` when that matters.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :keywords

          sig { params(keywords: T::Array[String]).void }
          attr_writer :keywords

          sig do
            params(
              type: Zavudev::Senders::Agent::FlowTrigger::Type::OrSymbol,
              intent: String,
              keywords: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            # What starts a flow.
            #
            # - `keyword`: the message contains one of the words listed in `keywords`. Plain
            #   substring matching, so a word inside another word still counts.
            # - `intent`: the message MEANS what `intent` describes, whatever words it uses.
            # - `always`: any message starts it.
            # - `manual`: reserved. Nothing starts a `manual` flow today — it is accepted and
            #   stored, and no message or endpoint runs it.
            type:,
            # One plain sentence describing what the contact wants, for `intent` triggers. Any
            # language.
            #
            # The message is judged for meaning, not for words, so "kiero saber el presio"
            # starts a flow whose intent is "quiere saber precios o cotizar", and "no quiero
            # info de precios" starts nothing.
            #
            # A `keyword` or `always` flow with a higher `priority` is matched first and wins.
            # At most 12 intent flows are considered per message, highest priority first. When
            # the classification is unavailable or uncertain, the message is handled as if no
            # intent matched, so a flow never starts on a guess.
            intent: nil,
            # Words that start the flow, for `keyword` triggers. Matched as substrings,
            # case-insensitively, against the whole message: a flow on `info` also starts on
            # "no quiero info". Use `intent` when that matters.
            keywords: nil
          )
          end

          sig do
            override.returns(
              {
                type: Zavudev::Senders::Agent::FlowTrigger::Type::OrSymbol,
                intent: String,
                keywords: T::Array[String]
              }
            )
          end
          def to_hash
          end

          # What starts a flow.
          #
          # - `keyword`: the message contains one of the words listed in `keywords`. Plain
          #   substring matching, so a word inside another word still counts.
          # - `intent`: the message MEANS what `intent` describes, whatever words it uses.
          # - `always`: any message starts it.
          # - `manual`: reserved. Nothing starts a `manual` flow today — it is accepted and
          #   stored, and no message or endpoint runs it.
          module Type
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Zavudev::Senders::Agent::FlowTrigger::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            KEYWORD =
              T.let(
                :keyword,
                Zavudev::Senders::Agent::FlowTrigger::Type::TaggedSymbol
              )
            INTENT =
              T.let(
                :intent,
                Zavudev::Senders::Agent::FlowTrigger::Type::TaggedSymbol
              )
            ALWAYS =
              T.let(
                :always,
                Zavudev::Senders::Agent::FlowTrigger::Type::TaggedSymbol
              )
            MANUAL =
              T.let(
                :manual,
                Zavudev::Senders::Agent::FlowTrigger::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Senders::Agent::FlowTrigger::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
