# typed: strong

module Zavudev
  module Models
    module Senders
      AgentTool = Agent::AgentTool

      module Agent
        class AgentTool < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::AgentTool,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :agent_id

          sig { returns(Time) }
          attr_accessor :created_at

          # Description for the LLM to understand when to use this tool.
          sig { returns(String) }
          attr_accessor :description

          sig { returns(T::Boolean) }
          attr_accessor :enabled

          sig { returns(String) }
          attr_accessor :name

          sig { returns(Zavudev::Senders::Agent::AgentTool::Parameters) }
          attr_reader :parameters

          sig do
            params(
              parameters: Zavudev::Senders::Agent::AgentTool::Parameters::OrHash
            ).void
          end
          attr_writer :parameters

          sig { returns(Time) }
          attr_accessor :updated_at

          # HTTPS URL to call when the tool is executed.
          sig { returns(String) }
          attr_accessor :webhook_url

          sig do
            params(
              id: String,
              agent_id: String,
              created_at: Time,
              description: String,
              enabled: T::Boolean,
              name: String,
              parameters:
                Zavudev::Senders::Agent::AgentTool::Parameters::OrHash,
              updated_at: Time,
              webhook_url: String
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            agent_id:,
            created_at:,
            # Description for the LLM to understand when to use this tool.
            description:,
            enabled:,
            name:,
            parameters:,
            updated_at:,
            # HTTPS URL to call when the tool is executed.
            webhook_url:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                agent_id: String,
                created_at: Time,
                description: String,
                enabled: T::Boolean,
                name: String,
                parameters: Zavudev::Senders::Agent::AgentTool::Parameters,
                updated_at: Time,
                webhook_url: String
              }
            )
          end
          def to_hash
          end

          class Parameters < Zavudev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Senders::Agent::AgentTool::Parameters,
                  Zavudev::Internal::AnyHash
                )
              end

            sig do
              returns(
                T::Hash[
                  Symbol,
                  Zavudev::Senders::Agent::AgentTool::Parameters::Property
                ]
              )
            end
            attr_accessor :properties

            sig { returns(T::Array[String]) }
            attr_accessor :required

            sig do
              returns(
                Zavudev::Senders::Agent::AgentTool::Parameters::Type::TaggedSymbol
              )
            end
            attr_accessor :type

            sig do
              params(
                properties:
                  T::Hash[
                    Symbol,
                    Zavudev::Senders::Agent::AgentTool::Parameters::Property::OrHash
                  ],
                required: T::Array[String],
                type:
                  Zavudev::Senders::Agent::AgentTool::Parameters::Type::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(properties:, required:, type:)
            end

            sig do
              override.returns(
                {
                  properties:
                    T::Hash[
                      Symbol,
                      Zavudev::Senders::Agent::AgentTool::Parameters::Property
                    ],
                  required: T::Array[String],
                  type:
                    Zavudev::Senders::Agent::AgentTool::Parameters::Type::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            class Property < Zavudev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Zavudev::Senders::Agent::AgentTool::Parameters::Property,
                    Zavudev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

              sig { returns(T.nilable(String)) }
              attr_reader :type

              sig { params(type: String).void }
              attr_writer :type

              sig do
                params(description: String, type: String).returns(
                  T.attached_class
                )
              end
              def self.new(description: nil, type: nil)
              end

              sig { override.returns({ description: String, type: String }) }
              def to_hash
              end
            end

            module Type
              extend Zavudev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Zavudev::Senders::Agent::AgentTool::Parameters::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              OBJECT =
                T.let(
                  :object,
                  Zavudev::Senders::Agent::AgentTool::Parameters::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Zavudev::Senders::Agent::AgentTool::Parameters::Type::TaggedSymbol
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
