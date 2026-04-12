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

          sig { returns(T::Array[Zavudev::Senders::Agent::FlowStep]) }
          attr_accessor :steps

          sig { returns(Zavudev::Senders::Agent::FlowTrigger) }
          attr_reader :trigger

          sig do
            params(trigger: Zavudev::Senders::Agent::FlowTrigger::OrHash).void
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
              steps: T::Array[Zavudev::Senders::Agent::FlowStep::OrHash],
              trigger: Zavudev::Senders::Agent::FlowTrigger::OrHash,
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
                steps: T::Array[Zavudev::Senders::Agent::FlowStep],
                trigger: Zavudev::Senders::Agent::FlowTrigger,
                description: String,
                enabled: T::Boolean,
                priority: Integer,
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
