# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        class AgentDocument < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute chunk_count
          #   Number of chunks created from this document.
          #
          #   @return [Integer]
          required :chunk_count, Integer, api_name: :chunkCount

          # @!attribute content_length
          #   Length of the document content in characters.
          #
          #   @return [Integer]
          required :content_length, Integer, api_name: :contentLength

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute is_processed
          #   Whether the document has been processed for RAG.
          #
          #   @return [Boolean]
          required :is_processed, Zavudev::Internal::Type::Boolean, api_name: :isProcessed

          # @!attribute knowledge_base_id
          #
          #   @return [String]
          required :knowledge_base_id, String, api_name: :knowledgeBaseId

          # @!attribute title
          #
          #   @return [String]
          required :title, String

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!method initialize(id:, chunk_count:, content_length:, created_at:, is_processed:, knowledge_base_id:, title:, updated_at:)
          #   @param id [String]
          #
          #   @param chunk_count [Integer] Number of chunks created from this document.
          #
          #   @param content_length [Integer] Length of the document content in characters.
          #
          #   @param created_at [Time]
          #
          #   @param is_processed [Boolean] Whether the document has been processed for RAG.
          #
          #   @param knowledge_base_id [String]
          #
          #   @param title [String]
          #
          #   @param updated_at [Time]
        end
      end

      AgentDocument = Agent::AgentDocument
    end
  end
end
