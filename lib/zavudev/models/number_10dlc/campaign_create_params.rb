# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Campaigns#create
      class CampaignCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute affiliate_marketing
        #
        #   @return [Boolean]
        required :affiliate_marketing, Zavudev::Internal::Type::Boolean, api_name: :affiliateMarketing

        # @!attribute age_gated
        #
        #   @return [Boolean]
        required :age_gated, Zavudev::Internal::Type::Boolean, api_name: :ageGated

        # @!attribute brand_id
        #   ID of the brand to create this campaign under.
        #
        #   @return [String]
        required :brand_id, String, api_name: :brandId

        # @!attribute description
        #
        #   @return [String]
        required :description, String

        # @!attribute direct_lending
        #
        #   @return [Boolean]
        required :direct_lending, Zavudev::Internal::Type::Boolean, api_name: :directLending

        # @!attribute embedded_link
        #
        #   @return [Boolean]
        required :embedded_link, Zavudev::Internal::Type::Boolean, api_name: :embeddedLink

        # @!attribute embedded_phone
        #
        #   @return [Boolean]
        required :embedded_phone, Zavudev::Internal::Type::Boolean, api_name: :embeddedPhone

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute number_pooling
        #
        #   @return [Boolean]
        required :number_pooling, Zavudev::Internal::Type::Boolean, api_name: :numberPooling

        # @!attribute sample_messages
        #
        #   @return [Array<String>]
        required :sample_messages, Zavudev::Internal::Type::ArrayOf[String], api_name: :sampleMessages

        # @!attribute subscriber_help
        #
        #   @return [Boolean]
        required :subscriber_help, Zavudev::Internal::Type::Boolean, api_name: :subscriberHelp

        # @!attribute subscriber_opt_in
        #
        #   @return [Boolean]
        required :subscriber_opt_in, Zavudev::Internal::Type::Boolean, api_name: :subscriberOptIn

        # @!attribute subscriber_opt_out
        #
        #   @return [Boolean]
        required :subscriber_opt_out, Zavudev::Internal::Type::Boolean, api_name: :subscriberOptOut

        # @!attribute use_case
        #   Campaign use case (e.g., ACCOUNT_NOTIFICATION, MARKETING, 2FA).
        #
        #   @return [String]
        required :use_case, String, api_name: :useCase

        # @!attribute help_message
        #
        #   @return [String, nil]
        optional :help_message, String, api_name: :helpMessage

        # @!attribute message_flow
        #
        #   @return [String, nil]
        optional :message_flow, String, api_name: :messageFlow

        # @!attribute opt_in_keywords
        #
        #   @return [Array<String>, nil]
        optional :opt_in_keywords, Zavudev::Internal::Type::ArrayOf[String], api_name: :optInKeywords

        # @!attribute opt_out_keywords
        #
        #   @return [Array<String>, nil]
        optional :opt_out_keywords, Zavudev::Internal::Type::ArrayOf[String], api_name: :optOutKeywords

        # @!attribute sub_use_cases
        #
        #   @return [Array<String>, nil]
        optional :sub_use_cases, Zavudev::Internal::Type::ArrayOf[String], api_name: :subUseCases

        # @!method initialize(affiliate_marketing:, age_gated:, brand_id:, description:, direct_lending:, embedded_link:, embedded_phone:, name:, number_pooling:, sample_messages:, subscriber_help:, subscriber_opt_in:, subscriber_opt_out:, use_case:, help_message: nil, message_flow: nil, opt_in_keywords: nil, opt_out_keywords: nil, sub_use_cases: nil, request_options: {})
        #   @param affiliate_marketing [Boolean]
        #
        #   @param age_gated [Boolean]
        #
        #   @param brand_id [String] ID of the brand to create this campaign under.
        #
        #   @param description [String]
        #
        #   @param direct_lending [Boolean]
        #
        #   @param embedded_link [Boolean]
        #
        #   @param embedded_phone [Boolean]
        #
        #   @param name [String]
        #
        #   @param number_pooling [Boolean]
        #
        #   @param sample_messages [Array<String>]
        #
        #   @param subscriber_help [Boolean]
        #
        #   @param subscriber_opt_in [Boolean]
        #
        #   @param subscriber_opt_out [Boolean]
        #
        #   @param use_case [String] Campaign use case (e.g., ACCOUNT_NOTIFICATION, MARKETING, 2FA).
        #
        #   @param help_message [String]
        #
        #   @param message_flow [String]
        #
        #   @param opt_in_keywords [Array<String>]
        #
        #   @param opt_out_keywords [Array<String>]
        #
        #   @param sub_use_cases [Array<String>]
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
