# typed: strong

module Zavudev
  module Models
    module Senders
      AgentFlow = Agent::AgentFlow

      module Agent
        class AgentFlow < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::AgentFlow,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :agent_id

          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(T::Boolean) }
          attr_accessor :enabled

          sig { returns(String) }
          attr_accessor :name

          # Priority when multiple flows match (higher = more priority).
          sig { returns(Integer) }
          attr_accessor :priority

          sig { returns(T::Array[Zavudev::Senders::Agent::AgentFlow::Step]) }
          attr_accessor :steps

          sig { returns(Zavudev::Senders::Agent::AgentFlow::Trigger) }
          attr_reader :trigger

          sig do
            params(
              trigger: Zavudev::Senders::Agent::AgentFlow::Trigger::OrHash
            ).void
          end
          attr_writer :trigger

          sig { returns(Time) }
          attr_accessor :updated_at

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig do
            params(
              id: String,
              agent_id: String,
              created_at: Time,
              enabled: T::Boolean,
              name: String,
              priority: Integer,
              steps: T::Array[Zavudev::Senders::Agent::AgentFlow::Step::OrHash],
              trigger: Zavudev::Senders::Agent::AgentFlow::Trigger::OrHash,
              updated_at: Time,
              description: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            agent_id:,
            created_at:,
            enabled:,
            name:,
            # Priority when multiple flows match (higher = more priority).
            priority:,
            steps:,
            trigger:,
            updated_at:,
            description: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                agent_id: String,
                created_at: Time,
                enabled: T::Boolean,
                name: String,
                priority: Integer,
                steps: T::Array[Zavudev::Senders::Agent::AgentFlow::Step],
                trigger: Zavudev::Senders::Agent::AgentFlow::Trigger,
                updated_at: Time,
                description: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          class Step < Zavudev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Senders::Agent::AgentFlow::Step,
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
            sig do
              returns(
                Zavudev::Senders::Agent::AgentFlow::Step::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            # ID of the next step to execute.
            sig { returns(T.nilable(String)) }
            attr_accessor :next_step_id

            sig do
              params(
                id: String,
                config: T::Hash[Symbol, T.anything],
                type: Zavudev::Senders::Agent::AgentFlow::Step::Type::OrSymbol,
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
                  type:
                    Zavudev::Senders::Agent::AgentFlow::Step::Type::TaggedSymbol,
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
                  T.all(Symbol, Zavudev::Senders::Agent::AgentFlow::Step::Type)
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MESSAGE =
                T.let(
                  :message,
                  Zavudev::Senders::Agent::AgentFlow::Step::Type::TaggedSymbol
                )
              COLLECT =
                T.let(
                  :collect,
                  Zavudev::Senders::Agent::AgentFlow::Step::Type::TaggedSymbol
                )
              CONDITION =
                T.let(
                  :condition,
                  Zavudev::Senders::Agent::AgentFlow::Step::Type::TaggedSymbol
                )
              TOOL =
                T.let(
                  :tool,
                  Zavudev::Senders::Agent::AgentFlow::Step::Type::TaggedSymbol
                )
              LLM =
                T.let(
                  :llm,
                  Zavudev::Senders::Agent::AgentFlow::Step::Type::TaggedSymbol
                )
              TRANSFER =
                T.let(
                  :transfer,
                  Zavudev::Senders::Agent::AgentFlow::Step::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Zavudev::Senders::Agent::AgentFlow::Step::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Trigger < Zavudev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Senders::Agent::AgentFlow::Trigger,
                  Zavudev::Internal::AnyHash
                )
              end

            # Type of trigger for a flow.
            sig do
              returns(
                Zavudev::Senders::Agent::AgentFlow::Trigger::Type::TaggedSymbol
              )
            end
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
                type:
                  Zavudev::Senders::Agent::AgentFlow::Trigger::Type::OrSymbol,
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
                  type:
                    Zavudev::Senders::Agent::AgentFlow::Trigger::Type::TaggedSymbol,
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
                  T.all(
                    Symbol,
                    Zavudev::Senders::Agent::AgentFlow::Trigger::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              KEYWORD =
                T.let(
                  :keyword,
                  Zavudev::Senders::Agent::AgentFlow::Trigger::Type::TaggedSymbol
                )
              INTENT =
                T.let(
                  :intent,
                  Zavudev::Senders::Agent::AgentFlow::Trigger::Type::TaggedSymbol
                )
              ALWAYS =
                T.let(
                  :always,
                  Zavudev::Senders::Agent::AgentFlow::Trigger::Type::TaggedSymbol
                )
              MANUAL =
                T.let(
                  :manual,
                  Zavudev::Senders::Agent::AgentFlow::Trigger::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Zavudev::Senders::Agent::AgentFlow::Trigger::Type::TaggedSymbol
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
end
