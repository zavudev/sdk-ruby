# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::KnowledgeBases#list
        class AgentKnowledgeBase < Zavudev::Internal::Type::BaseModel
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

          # @!attribute document_count
          #
          #   @return [Integer]
          required :document_count, Integer, api_name: :documentCount

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute total_chunks
          #
          #   @return [Integer]
          required :total_chunks, Integer, api_name: :totalChunks

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!method initialize(id:, agent_id:, created_at:, document_count:, name:, total_chunks:, updated_at:, description: nil)
          #   @param id [String]
          #   @param agent_id [String]
          #   @param created_at [Time]
          #   @param document_count [Integer]
          #   @param name [String]
          #   @param total_chunks [Integer]
          #   @param updated_at [Time]
          #   @param description [String, nil]
        end
      end

      AgentKnowledgeBase = Agent::AgentKnowledgeBase
    end
  end
end
