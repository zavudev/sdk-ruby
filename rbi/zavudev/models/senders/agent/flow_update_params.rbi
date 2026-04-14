# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class FlowUpdateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::FlowUpdateParams,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(String) }
          attr_accessor :flow_id

          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enabled

          sig { params(enabled: T::Boolean).void }
          attr_writer :enabled

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { returns(T.nilable(Integer)) }
          attr_reader :priority

          sig { params(priority: Integer).void }
          attr_writer :priority

          sig do
            returns(T.nilable(T::Array[Zavudev::Senders::Agent::FlowStep]))
          end
          attr_reader :steps

          sig do
            params(
              steps: T::Array[Zavudev::Senders::Agent::FlowStep::OrHash]
            ).void
          end
          attr_writer :steps

          sig { returns(T.nilable(Zavudev::Senders::Agent::FlowTrigger)) }
          attr_reader :trigger

          sig do
            params(trigger: Zavudev::Senders::Agent::FlowTrigger::OrHash).void
          end
          attr_writer :trigger

          sig do
            params(
              sender_id: String,
              flow_id: String,
              description: String,
              enabled: T::Boolean,
              name: String,
              priority: Integer,
              steps: T::Array[Zavudev::Senders::Agent::FlowStep::OrHash],
              trigger: Zavudev::Senders::Agent::FlowTrigger::OrHash,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            sender_id:,
            flow_id:,
            description: nil,
            enabled: nil,
            name: nil,
            priority: nil,
            steps: nil,
            trigger: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                sender_id: String,
                flow_id: String,
                description: String,
                enabled: T::Boolean,
                name: String,
                priority: Integer,
                steps: T::Array[Zavudev::Senders::Agent::FlowStep],
                trigger: Zavudev::Senders::Agent::FlowTrigger,
                request_options: Zavudev::RequestOptions
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
