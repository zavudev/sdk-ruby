# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Tools#list
        class AgentTool < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute agent_id
          #
          #   @return [String]
          required :agent_id, String, api_name: :agentId

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute description
          #   Description for the LLM to understand when to use this tool.
          #
          #   @return [String]
          required :description, String

          # @!attribute enabled
          #
          #   @return [Boolean]
          required :enabled, Zavudev::Internal::Type::Boolean

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute parameters
          #
          #   @return [Zavudev::Models::Senders::Agent::ToolParameters]
          required :parameters, -> { Zavudev::Senders::Agent::ToolParameters }

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!attribute webhook_url
          #   HTTPS URL to call when the tool is executed.
          #
          #   @return [String]
          required :webhook_url, String, api_name: :webhookUrl

          # @!attribute webhook_secret
          #   Signing secret for this tool's webhook. **Returned only when the tool is
          #   created**, never on a later read.
          #
          #   Zavu generates one if you do not supply it, and signs every call to this tool
          #   with it: `X-Zavu-Signature: <hex>`, the HMAC-SHA256 of the request body. Verify
          #   it before trusting the call. Lost it? Rotate with
          #   `POST /v1/senders/{senderId}/agent/tools/{toolId}/webhook/secret`.
          #
          #   @return [String, nil]
          optional :webhook_secret, String, api_name: :webhookSecret

          # @!method initialize(id:, agent_id:, created_at:, description:, enabled:, name:, parameters:, updated_at:, webhook_url:, webhook_secret: nil)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::Senders::Agent::AgentTool} for more details.
          #
          #   @param id [String]
          #
          #   @param agent_id [String]
          #
          #   @param created_at [Time]
          #
          #   @param description [String] Description for the LLM to understand when to use this tool.
          #
          #   @param enabled [Boolean]
          #
          #   @param name [String]
          #
          #   @param parameters [Zavudev::Models::Senders::Agent::ToolParameters]
          #
          #   @param updated_at [Time]
          #
          #   @param webhook_url [String] HTTPS URL to call when the tool is executed.
          #
          #   @param webhook_secret [String] Signing secret for this tool's webhook. \*\*Returned only when the tool is
          #   created
        end
      end

      AgentTool = Agent::AgentTool
    end
  end
end
