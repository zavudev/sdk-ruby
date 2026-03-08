# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::KnowledgeBases#create
        class KnowledgeBaseCreateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute sender_id
          #
          #   @return [String]
          required :sender_id, String

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String

          # @!method initialize(sender_id:, name:, description: nil, request_options: {})
          #   @param sender_id [String]
          #   @param name [String]
          #   @param description [String]
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
