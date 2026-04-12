# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class FlowStep < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::FlowStep,
                Zavudev::Internal::AnyHash
              )
            end

          # Unique step identifier.
          sig { returns(String) }
          attr_accessor :id

          # Step configuration (varies by type).
          sig { returns(T::Hash[Symbol, T.anything]) }
          attr_accessor :config

          # Type of flow step.
          sig { returns(Zavudev::Senders::Agent::FlowStep::Type::OrSymbol) }
          attr_accessor :type

          # ID of the next step to execute.
          sig { returns(T.nilable(String)) }
          attr_accessor :next_step_id

          sig do
            params(
              id: String,
              config: T::Hash[Symbol, T.anything],
              type: Zavudev::Senders::Agent::FlowStep::Type::OrSymbol,
              next_step_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique step identifier.
            id:,
            # Step configuration (varies by type).
            config:,
            # Type of flow step.
            type:,
            # ID of the next step to execute.
            next_step_id: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                config: T::Hash[Symbol, T.anything],
                type: Zavudev::Senders::Agent::FlowStep::Type::OrSymbol,
                next_step_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Type of flow step.
          module Type
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Zavudev::Senders::Agent::FlowStep::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MESSAGE =
              T.let(
                :message,
                Zavudev::Senders::Agent::FlowStep::Type::TaggedSymbol
              )
            COLLECT =
              T.let(
                :collect,
                Zavudev::Senders::Agent::FlowStep::Type::TaggedSymbol
              )
            CONDITION =
              T.let(
                :condition,
                Zavudev::Senders::Agent::FlowStep::Type::TaggedSymbol
              )
            TOOL =
              T.let(
                :tool,
                Zavudev::Senders::Agent::FlowStep::Type::TaggedSymbol
              )
            LLM =
              T.let(:llm, Zavudev::Senders::Agent::FlowStep::Type::TaggedSymbol)
            TRANSFER =
              T.let(
                :transfer,
                Zavudev::Senders::Agent::FlowStep::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[Zavudev::Senders::Agent::FlowStep::Type::TaggedSymbol]
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
