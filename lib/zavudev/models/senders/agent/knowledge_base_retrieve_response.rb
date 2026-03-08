# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::KnowledgeBases#retrieve
        class KnowledgeBaseRetrieveResponse < Zavudev::Internal::Type::BaseModel
          # @!attribute knowledge_base
          #
          #   @return [Zavudev::Models::Senders::Agent::AgentKnowledgeBase]
          required :knowledge_base,
                   -> {
                     Zavudev::Senders::Agent::AgentKnowledgeBase
                   },
                   api_name: :knowledgeBase

          # @!method initialize(knowledge_base:)
          #   @param knowledge_base [Zavudev::Models::Senders::Agent::AgentKnowledgeBase]
        end
      end
    end
  end
end
