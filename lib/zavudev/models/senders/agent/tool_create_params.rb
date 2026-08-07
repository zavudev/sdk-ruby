# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      module Agent
        # @see Zavudev::Resources::Senders::Agent::Tools#create
        class ToolCreateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          # @!attribute sender_id
          #
          #   @return [String]
          required :sender_id, String

          # @!attribute description
          #
          #   @return [String]
          required :description, String

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute parameters
          #
          #   @return [Zavudev::Models::Senders::Agent::ToolParameters]
          required :parameters, -> { Zavudev::Senders::Agent::ToolParameters }

          # @!attribute webhook_url
          #   Must be HTTPS.
          #
          #   @return [String]
          required :webhook_url, String, api_name: :webhookUrl

          # @!attribute enabled
          #
          #   @return [Boolean, nil]
          optional :enabled, Zavudev::Internal::Type::Boolean

          # @!attribute webhook_secret
          #   Signing secret for the webhook. Optional: Zavu generates one when omitted and
          #   returns it on this response only. Supply your own if you already have a secret
          #   you want reused.
          #
          #   @return [String, nil]
          optional :webhook_secret, String, api_name: :webhookSecret

          # @!method initialize(sender_id:, description:, name:, parameters:, webhook_url:, enabled: nil, webhook_secret: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::Senders::Agent::ToolCreateParams} for more details.
          #
          #   @param sender_id [String]
          #
          #   @param description [String]
          #
          #   @param name [String]
          #
          #   @param parameters [Zavudev::Models::Senders::Agent::ToolParameters]
          #
          #   @param webhook_url [String] Must be HTTPS.
          #
          #   @param enabled [Boolean]
          #
          #   @param webhook_secret [String] Signing secret for the webhook. Optional: Zavu generates one when omitted and re
          #
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
