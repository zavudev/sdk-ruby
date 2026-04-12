# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Tools#update
        class ToolUpdateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute sender_id
          #
          #   @return [String]
          required :sender_id, String

          # @!attribute tool_id
          #
          #   @return [String]
          required :tool_id, String

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute enabled
          #
          #   @return [Boolean, nil]
          optional :enabled, Zavudev::Internal::Type::Boolean

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute parameters
          #
          #   @return [Zavudev::Models::Senders::Agent::ToolParameters, nil]
          optional :parameters, -> { Zavudev::Senders::Agent::ToolParameters }

          # @!attribute webhook_secret
          #
          #   @return [String, nil]
          optional :webhook_secret, String, api_name: :webhookSecret, nil?: true

          # @!attribute webhook_url
          #
          #   @return [String, nil]
          optional :webhook_url, String, api_name: :webhookUrl

          # @!method initialize(sender_id:, tool_id:, description: nil, enabled: nil, name: nil, parameters: nil, webhook_secret: nil, webhook_url: nil, request_options: {})
          #   @param sender_id [String]
          #   @param tool_id [String]
          #   @param description [String]
          #   @param enabled [Boolean]
          #   @param name [String]
          #   @param parameters [Zavudev::Models::Senders::Agent::ToolParameters]
          #   @param webhook_secret [String, nil]
          #   @param webhook_url [String]
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
