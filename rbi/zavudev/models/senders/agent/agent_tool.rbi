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

          sig { returns(Zavudev::Senders::Agent::ToolParameters) }
          attr_reader :parameters

          sig do
            params(
              parameters: Zavudev::Senders::Agent::ToolParameters::OrHash
            ).void
          end
          attr_writer :parameters

          sig { returns(Time) }
          attr_accessor :updated_at

          # HTTPS URL to call when the tool is executed.
          sig { returns(String) }
          attr_accessor :webhook_url

          # Signing secret for this tool's webhook. **Returned only when the tool is
          # created**, never on a later read.
          #
          # Zavu generates one if you do not supply it, and signs every call to this tool
          # with it: `X-Zavu-Signature: <hex>`, the HMAC-SHA256 of the request body. Verify
          # it before trusting the call. Lost it? Rotate with
          # `POST /v1/senders/{senderId}/agent/tools/{toolId}/webhook/secret`.
          sig { returns(T.nilable(String)) }
          attr_reader :webhook_secret

          sig { params(webhook_secret: String).void }
          attr_writer :webhook_secret

          sig do
            params(
              id: String,
              agent_id: String,
              created_at: Time,
              description: String,
              enabled: T::Boolean,
              name: String,
              parameters: Zavudev::Senders::Agent::ToolParameters::OrHash,
              updated_at: Time,
              webhook_url: String,
              webhook_secret: String
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
            webhook_url:,
            # Signing secret for this tool's webhook. **Returned only when the tool is
            # created**, never on a later read.
            #
            # Zavu generates one if you do not supply it, and signs every call to this tool
            # with it: `X-Zavu-Signature: <hex>`, the HMAC-SHA256 of the request body. Verify
            # it before trusting the call. Lost it? Rotate with
            # `POST /v1/senders/{senderId}/agent/tools/{toolId}/webhook/secret`.
            webhook_secret: nil
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
                parameters: Zavudev::Senders::Agent::ToolParameters,
                updated_at: Time,
                webhook_url: String,
                webhook_secret: String
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
