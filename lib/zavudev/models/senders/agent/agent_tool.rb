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

          # @!method initialize(id:, agent_id:, created_at:, description:, enabled:, name:, parameters:, updated_at:, webhook_url:)
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
        end
      end

      AgentTool = Agent::AgentTool
    end
  end
end
