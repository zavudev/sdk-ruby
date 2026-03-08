# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        module KnowledgeBases
          # @see Zavudev::Resources::Senders::Agent::KnowledgeBases::Documents#create
          class DocumentCreateParams < Zavudev::Internal::Type::BaseModel
            extend Zavudev::Internal::Type::RequestParameters::Converter
            include Zavudev::Internal::Type::RequestParameters

            # @!attribute sender_id
            #
            #   @return [String]
            required :sender_id, String

            # @!attribute kb_id
            #
            #   @return [String]
            required :kb_id, String

            # @!attribute content
            #
            #   @return [String]
            required :content, String

            # @!attribute title
            #
            #   @return [String]
            required :title, String

            # @!method initialize(sender_id:, kb_id:, content:, title:, request_options: {})
            #   @param sender_id [String]
            #   @param kb_id [String]
            #   @param content [String]
            #   @param title [String]
            #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
