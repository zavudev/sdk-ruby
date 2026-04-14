# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Campaigns#update
      class CampaignUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute campaign_id
        #
        #   @return [String]
        required :campaign_id, String

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute help_message
        #
        #   @return [String, nil]
        optional :help_message, String, api_name: :helpMessage

        # @!attribute message_flow
        #
        #   @return [String, nil]
        optional :message_flow, String, api_name: :messageFlow

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute opt_in_keywords
        #
        #   @return [Array<String>, nil]
        optional :opt_in_keywords, Zavudev::Internal::Type::ArrayOf[String], api_name: :optInKeywords

        # @!attribute opt_out_keywords
        #
        #   @return [Array<String>, nil]
        optional :opt_out_keywords, Zavudev::Internal::Type::ArrayOf[String], api_name: :optOutKeywords

        # @!attribute sample_messages
        #
        #   @return [Array<String>, nil]
        optional :sample_messages, Zavudev::Internal::Type::ArrayOf[String], api_name: :sampleMessages

        # @!method initialize(campaign_id:, description: nil, help_message: nil, message_flow: nil, name: nil, opt_in_keywords: nil, opt_out_keywords: nil, sample_messages: nil, request_options: {})
        #   @param campaign_id [String]
        #   @param description [String]
        #   @param help_message [String]
        #   @param message_flow [String]
        #   @param name [String]
        #   @param opt_in_keywords [Array<String>]
        #   @param opt_out_keywords [Array<String>]
        #   @param sample_messages [Array<String>]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
