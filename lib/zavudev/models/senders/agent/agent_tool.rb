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
          #   @return [Zavudev::Models::Senders::Agent::AgentTool::Parameters]
          required :parameters, -> { Zavudev::Senders::Agent::AgentTool::Parameters }

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
          #   @param parameters [Zavudev::Models::Senders::Agent::AgentTool::Parameters]
          #
          #   @param updated_at [Time]
          #
          #   @param webhook_url [String] HTTPS URL to call when the tool is executed.

          # @see Zavudev::Models::Senders::Agent::AgentTool#parameters
          class Parameters < Zavudev::Internal::Type::BaseModel
            # @!attribute properties
            #
            #   @return [Hash{Symbol=>Zavudev::Models::Senders::Agent::AgentTool::Parameters::Property}]
            required :properties,
                     -> { Zavudev::Internal::Type::HashOf[Zavudev::Senders::Agent::AgentTool::Parameters::Property] }

            # @!attribute required
            #
            #   @return [Array<String>]
            required :required, Zavudev::Internal::Type::ArrayOf[String]

            # @!attribute type
            #
            #   @return [Symbol, Zavudev::Models::Senders::Agent::AgentTool::Parameters::Type]
            required :type, enum: -> { Zavudev::Senders::Agent::AgentTool::Parameters::Type }

            # @!method initialize(properties:, required:, type:)
            #   @param properties [Hash{Symbol=>Zavudev::Models::Senders::Agent::AgentTool::Parameters::Property}]
            #   @param required [Array<String>]
            #   @param type [Symbol, Zavudev::Models::Senders::Agent::AgentTool::Parameters::Type]

            class Property < Zavudev::Internal::Type::BaseModel
              # @!attribute description
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute type
              #
              #   @return [String, nil]
              optional :type, String

              # @!method initialize(description: nil, type: nil)
              #   @param description [String]
              #   @param type [String]
            end

            # @see Zavudev::Models::Senders::Agent::AgentTool::Parameters#type
            module Type
              extend Zavudev::Internal::Type::Enum

              OBJECT = :object

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end

      AgentTool = Agent::AgentTool
    end
  end
end
