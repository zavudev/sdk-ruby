# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class FlowCreateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::FlowCreateParams,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(String) }
          attr_accessor :name

          sig do
            returns(T::Array[Zavudev::Senders::Agent::FlowCreateParams::Step])
          end
          attr_accessor :steps

          sig { returns(Zavudev::Senders::Agent::FlowCreateParams::Trigger) }
          attr_reader :trigger

          sig do
            params(
              trigger:
                Zavudev::Senders::Agent::FlowCreateParams::Trigger::OrHash
            ).void
          end
          attr_writer :trigger

          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enabled

          sig { params(enabled: T::Boolean).void }
          attr_writer :enabled

          sig { returns(T.nilable(Integer)) }
          attr_reader :priority

          sig { params(priority: Integer).void }
          attr_writer :priority

          sig do
            params(
              sender_id: String,
              name: String,
              steps:
                T::Array[
                  Zavudev::Senders::Agent::FlowCreateParams::Step::OrHash
                ],
              trigger:
                Zavudev::Senders::Agent::FlowCreateParams::Trigger::OrHash,
              description: String,
              enabled: T::Boolean,
              priority: Integer,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            sender_id:,
            name:,
            steps:,
            trigger:,
            description: nil,
            enabled: nil,
            priority: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                sender_id: String,
                name: String,
                steps:
                  T::Array[Zavudev::Senders::Agent::FlowCreateParams::Step],
                trigger: Zavudev::Senders::Agent::FlowCreateParams::Trigger,
                description: String,
                enabled: T::Boolean,
                priority: Integer,
                request_options: Zavudev::RequestOptions
              }
            )
          end
          def to_hash
          end

          class Step < Zavudev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Senders::Agent::FlowCreateParams::Step,
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
                Zavudev::Senders::Agent::FlowCreateParams::Step::Type::OrSymbol
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
                type:
                  Zavudev::Senders::Agent::FlowCreateParams::Step::Type::OrSymbol,
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
                    Zavudev::Senders::Agent::FlowCreateParams::Step::Type::OrSymbol,
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
                  T.all(
                    Symbol,
                    Zavudev::Senders::Agent::FlowCreateParams::Step::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MESSAGE =
                T.let(
                  :message,
                  Zavudev::Senders::Agent::FlowCreateParams::Step::Type::TaggedSymbol
                )
              COLLECT =
                T.let(
                  :collect,
                  Zavudev::Senders::Agent::FlowCreateParams::Step::Type::TaggedSymbol
                )
              CONDITION =
                T.let(
                  :condition,
                  Zavudev::Senders::Agent::FlowCreateParams::Step::Type::TaggedSymbol
                )
              TOOL =
                T.let(
                  :tool,
                  Zavudev::Senders::Agent::FlowCreateParams::Step::Type::TaggedSymbol
                )
              LLM =
                T.let(
                  :llm,
                  Zavudev::Senders::Agent::FlowCreateParams::Step::Type::TaggedSymbol
                )
              TRANSFER =
                T.let(
                  :transfer,
                  Zavudev::Senders::Agent::FlowCreateParams::Step::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Zavudev::Senders::Agent::FlowCreateParams::Step::Type::TaggedSymbol
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
                  Zavudev::Senders::Agent::FlowCreateParams::Trigger,
                  Zavudev::Internal::AnyHash
                )
              end

            # Type of trigger for a flow.
            sig do
              returns(
                Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type::OrSymbol
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
                  Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type::OrSymbol,
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
                    Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type::OrSymbol,
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
                    Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              KEYWORD =
                T.let(
                  :keyword,
                  Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type::TaggedSymbol
                )
              INTENT =
                T.let(
                  :intent,
                  Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type::TaggedSymbol
                )
              ALWAYS =
                T.let(
                  :always,
                  Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type::TaggedSymbol
                )
              MANUAL =
                T.let(
                  :manual,
                  Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Zavudev::Senders::Agent::FlowCreateParams::Trigger::Type::TaggedSymbol
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
