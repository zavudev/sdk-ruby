# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolCreateResponse < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Senders::Agent::ToolCreateResponse,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(Zavudev::Senders::Agent::AgentTool) }
          attr_reader :tool

          sig { params(tool: Zavudev::Senders::Agent::AgentTool::OrHash).void }
          attr_writer :tool

          sig do
            params(tool: Zavudev::Senders::Agent::AgentTool::OrHash).returns(
              T.attached_class
            )
          end
          def self.new(tool:)
          end

          sig { override.returns({ tool: Zavudev::Senders::Agent::AgentTool }) }
          def to_hash
          end
        end
      end
    end
  end
end
