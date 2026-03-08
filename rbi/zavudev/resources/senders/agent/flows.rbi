# typed: strong

module Zavudev
  module Resources
    class Senders
      class Agent
        class Flows
          # Create a new flow for an agent.
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
            ).returns(Zavudev::Models::Senders::Agent::FlowCreateResponse)
          end
          def create(
            sender_id,
            name:,
            steps:,
            trigger:,
            description: nil,
            enabled: nil,
            priority: nil,
            request_options: {}
          )
          end

          # Get a specific flow.
          sig do
            params(
              flow_id: String,
              sender_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(Zavudev::Models::Senders::Agent::FlowRetrieveResponse)
          end
          def retrieve(flow_id, sender_id:, request_options: {})
          end

          # Update a flow.
          sig do
            params(
              flow_id: String,
              sender_id: String,
              description: String,
              enabled: T::Boolean,
              name: String,
              priority: Integer,
              steps:
                T::Array[
                  Zavudev::Senders::Agent::FlowUpdateParams::Step::OrHash
                ],
              trigger:
                Zavudev::Senders::Agent::FlowUpdateParams::Trigger::OrHash,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(Zavudev::Models::Senders::Agent::FlowUpdateResponse)
          end
          def update(
            # Path param
            flow_id,
            # Path param
            sender_id:,
            # Body param
            description: nil,
            # Body param
            enabled: nil,
            # Body param
            name: nil,
            # Body param
            priority: nil,
            # Body param
            steps: nil,
            # Body param
            trigger: nil,
            request_options: {}
          )
          end

          # List flows for an agent.
          sig do
            params(
              sender_id: String,
              cursor: String,
              enabled: T::Boolean,
              limit: Integer,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Internal::Cursor[Zavudev::Senders::Agent::AgentFlow]
            )
          end
          def list(
            sender_id,
            cursor: nil,
            enabled: nil,
            limit: nil,
            request_options: {}
          )
          end

          # Delete a flow. Cannot delete flows with active sessions.
          sig do
            params(
              flow_id: String,
              sender_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).void
          end
          def delete(flow_id, sender_id:, request_options: {})
          end

          # Create a copy of an existing flow with a new name.
          sig do
            params(
              flow_id: String,
              sender_id: String,
              new_name: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(Zavudev::Models::Senders::Agent::FlowDuplicateResponse)
          end
          def duplicate(
            # Path param
            flow_id,
            # Path param
            sender_id:,
            # Body param
            new_name:,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Zavudev::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
