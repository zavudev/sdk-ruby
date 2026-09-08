# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::AgentTemplates#list
    class AgentTemplateListResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute items
      #
      #   @return [Array<Zavudev::Models::AgentTemplateListResponse::Item>]
      required :items, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::AgentTemplateListResponse::Item] }

      # @!method initialize(items:)
      #   @param items [Array<Zavudev::Models::AgentTemplateListResponse::Item>]

      class Item < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute category
        #
        #   @return [Symbol, Zavudev::Models::AgentTemplateListResponse::Item::Category]
        required :category, enum: -> { Zavudev::Models::AgentTemplateListResponse::Item::Category }

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute summary
        #
        #   @return [String]
        required :summary, String

        # @!attribute tool_count
        #
        #   @return [Integer]
        required :tool_count, Integer, api_name: :toolCount

        # @!attribute voice
        #   Whether this agent answers phone calls.
        #
        #   @return [Boolean]
        required :voice, Zavudev::Internal::Type::Boolean

        # @!method initialize(id:, category:, name:, summary:, tool_count:, voice:)
        #   Compact catalog entry for a factory agent.
        #
        #   @param id [String]
        #
        #   @param category [Symbol, Zavudev::Models::AgentTemplateListResponse::Item::Category]
        #
        #   @param name [String]
        #
        #   @param summary [String]
        #
        #   @param tool_count [Integer]
        #
        #   @param voice [Boolean] Whether this agent answers phone calls.

        # @see Zavudev::Models::AgentTemplateListResponse::Item#category
        module Category
          extend Zavudev::Internal::Type::Enum

          SALES = :sales
          SUPPORT = :support
          FRONT_DESK = :frontDesk
          OPS = :ops

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
