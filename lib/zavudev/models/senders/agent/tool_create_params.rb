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
          #   @return [Zavudev::Models::Senders::Agent::ToolCreateParams::Parameters]
          required :parameters, -> { Zavudev::Senders::Agent::ToolCreateParams::Parameters }

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
          #   Optional secret for webhook signature verification.
          #
          #   @return [String, nil]
          optional :webhook_secret, String, api_name: :webhookSecret

          # @!method initialize(sender_id:, description:, name:, parameters:, webhook_url:, enabled: nil, webhook_secret: nil, request_options: {})
          #   @param sender_id [String]
          #
          #   @param description [String]
          #
          #   @param name [String]
          #
          #   @param parameters [Zavudev::Models::Senders::Agent::ToolCreateParams::Parameters]
          #
          #   @param webhook_url [String] Must be HTTPS.
          #
          #   @param enabled [Boolean]
          #
          #   @param webhook_secret [String] Optional secret for webhook signature verification.
          #
          #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

          class Parameters < Zavudev::Internal::Type::BaseModel
            # @!attribute properties
            #
            #   @return [Hash{Symbol=>Zavudev::Models::Senders::Agent::ToolCreateParams::Parameters::Property}]
            required :properties,
                     -> { Zavudev::Internal::Type::HashOf[Zavudev::Senders::Agent::ToolCreateParams::Parameters::Property] }

            # @!attribute required
            #
            #   @return [Array<String>]
            required :required, Zavudev::Internal::Type::ArrayOf[String]

            # @!attribute type
            #
            #   @return [Symbol, Zavudev::Models::Senders::Agent::ToolCreateParams::Parameters::Type]
            required :type, enum: -> { Zavudev::Senders::Agent::ToolCreateParams::Parameters::Type }

            # @!method initialize(properties:, required:, type:)
            #   @param properties [Hash{Symbol=>Zavudev::Models::Senders::Agent::ToolCreateParams::Parameters::Property}]
            #   @param required [Array<String>]
            #   @param type [Symbol, Zavudev::Models::Senders::Agent::ToolCreateParams::Parameters::Type]

            class Property < Zavudev::Internal::Type::BaseModel
              # @!attribute description
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute type
              #
              #   @return [String, nil]
              optional :type, String

              # @!method initialize(description: nil, type: nil)
              #   @param description [String]
              #   @param type [String]
            end

            # @see Zavudev::Models::Senders::Agent::ToolCreateParams::Parameters#type
            module Type
              extend Zavudev::Internal::Type::Enum

              OBJECT = :object

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
