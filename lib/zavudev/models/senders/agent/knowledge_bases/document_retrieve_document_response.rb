# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        module KnowledgeBases
          # @see Zavudev::Resources::Senders::Agent::KnowledgeBases::Documents#retrieve_document
          class DocumentRetrieveDocumentResponse < Zavudev::Internal::Type::BaseModel
            # @!attribute document
            #
            #   @return [Zavudev::Models::Senders::Agent::AgentDocument]
            required :document, -> { Zavudev::Senders::Agent::AgentDocument }

            # @!method initialize(document:)
            #   @param document [Zavudev::Models::Senders::Agent::AgentDocument]
          end
        end
      end
    end
  end
end
