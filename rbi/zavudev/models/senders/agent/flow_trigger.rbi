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

          # Type of trigger for a flow.
          sig { returns(Zavudev::Senders::Agent::FlowTrigger::Type::OrSymbol) }
          attr_accessor :type

          # Intent that triggers the flow (for intent type).
          sig { returns(T.nilable(String)) }
          attr_reader :intent

          sig { params(intent: String).void }
          attr_writer :intent

          # Keywords that trigger the flow (for keyword type).
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
            # Type of trigger for a flow.
            type:,
            # Intent that triggers the flow (for intent type).
            intent: nil,
            # Keywords that trigger the flow (for keyword type).
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

          # Type of trigger for a flow.
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
