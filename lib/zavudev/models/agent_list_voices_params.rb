# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Agents#list_voices
    class AgentListVoicesParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute language
      #   BCP-47 tag (`en`, `es`, `pt-BR`). Omit, or pass `auto`, for every voice.
      #
      #   @return [String, nil]
      optional :language, String

      # @!method initialize(language: nil, request_options: {})
      #   @param language [String] BCP-47 tag (`en`, `es`, `pt-BR`). Omit, or pass `auto`, for every voice.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
