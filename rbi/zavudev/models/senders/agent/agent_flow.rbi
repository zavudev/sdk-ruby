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

          sig { returns(T::Array[Zavudev::Senders::Agent::FlowStep]) }
          attr_accessor :steps

          sig { returns(Zavudev::Senders::Agent::FlowTrigger) }
          attr_reader :trigger

          sig do
            params(trigger: Zavudev::Senders::Agent::FlowTrigger::OrHash).void
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
              steps: T::Array[Zavudev::Senders::Agent::FlowStep::OrHash],
              trigger: Zavudev::Senders::Agent::FlowTrigger::OrHash,
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
                steps: T::Array[Zavudev::Senders::Agent::FlowStep],
                trigger: Zavudev::Senders::Agent::FlowTrigger,
                updated_at: Time,
                description: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
