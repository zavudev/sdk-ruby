# frozen_string_literal: true

module Zavudev
  module Models
    module Number10dlc
      # @see Zavudev::Resources::Number10dlc::Campaigns#list
      class TenDlcCampaign < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute affiliate_marketing
        #
        #   @return [Boolean]
        required :affiliate_marketing, Zavudev::Internal::Type::Boolean, api_name: :affiliateMarketing

        # @!attribute age_gated
        #
        #   @return [Boolean]
        required :age_gated, Zavudev::Internal::Type::Boolean, api_name: :ageGated

        # @!attribute brand_id
        #   ID of the brand this campaign belongs to.
        #
        #   @return [String]
        required :brand_id, String, api_name: :brandId

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute description
        #   Description of the messaging campaign.
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
        #   Sample messages representative of campaign content.
        #
        #   @return [Array<String>]
        required :sample_messages, Zavudev::Internal::Type::ArrayOf[String], api_name: :sampleMessages

        # @!attribute status
        #   Status of a 10DLC campaign registration.
        #
        #   @return [Symbol, Zavudev::Models::Number10dlc::TenDlcCampaign::Status]
        required :status, enum: -> { Zavudev::Number10dlc::TenDlcCampaign::Status }

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

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!attribute use_case
        #   Campaign use case type.
        #
        #   @return [String]
        required :use_case, String, api_name: :useCase

        # @!attribute approved_at
        #
        #   @return [Time, nil]
        optional :approved_at, Time, api_name: :approvedAt, nil?: true

        # @!attribute daily_limit
        #   Daily message limit based on brand trust score.
        #
        #   @return [Integer, nil]
        optional :daily_limit, Integer, api_name: :dailyLimit, nil?: true

        # @!attribute failure_reason
        #
        #   @return [String, nil]
        optional :failure_reason, String, api_name: :failureReason, nil?: true

        # @!attribute help_message
        #
        #   @return [String, nil]
        optional :help_message, String, api_name: :helpMessage, nil?: true

        # @!attribute message_flow
        #
        #   @return [String, nil]
        optional :message_flow, String, api_name: :messageFlow, nil?: true

        # @!attribute monthly_fee_cents
        #   Recurring monthly fee in cents.
        #
        #   @return [Integer, nil]
        optional :monthly_fee_cents, Integer, api_name: :monthlyFeeCents, nil?: true

        # @!attribute opt_in_keywords
        #
        #   @return [Array<String>, nil]
        optional :opt_in_keywords,
                 Zavudev::Internal::Type::ArrayOf[String],
                 api_name: :optInKeywords,
                 nil?: true

        # @!attribute opt_out_keywords
        #
        #   @return [Array<String>, nil]
        optional :opt_out_keywords,
                 Zavudev::Internal::Type::ArrayOf[String],
                 api_name: :optOutKeywords,
                 nil?: true

        # @!attribute registration_cost_cents
        #   One-time registration cost in cents.
        #
        #   @return [Integer, nil]
        optional :registration_cost_cents, Integer, api_name: :registrationCostCents, nil?: true

        # @!attribute submitted_at
        #
        #   @return [Time, nil]
        optional :submitted_at, Time, api_name: :submittedAt, nil?: true

        # @!attribute sub_use_cases
        #
        #   @return [Array<String>, nil]
        optional :sub_use_cases, Zavudev::Internal::Type::ArrayOf[String], api_name: :subUseCases, nil?: true

        # @!method initialize(id:, affiliate_marketing:, age_gated:, brand_id:, created_at:, description:, direct_lending:, embedded_link:, embedded_phone:, name:, number_pooling:, sample_messages:, status:, subscriber_help:, subscriber_opt_in:, subscriber_opt_out:, updated_at:, use_case:, approved_at: nil, daily_limit: nil, failure_reason: nil, help_message: nil, message_flow: nil, monthly_fee_cents: nil, opt_in_keywords: nil, opt_out_keywords: nil, registration_cost_cents: nil, submitted_at: nil, sub_use_cases: nil)
        #   @param id [String]
        #
        #   @param affiliate_marketing [Boolean]
        #
        #   @param age_gated [Boolean]
        #
        #   @param brand_id [String] ID of the brand this campaign belongs to.
        #
        #   @param created_at [Time]
        #
        #   @param description [String] Description of the messaging campaign.
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
        #   @param sample_messages [Array<String>] Sample messages representative of campaign content.
        #
        #   @param status [Symbol, Zavudev::Models::Number10dlc::TenDlcCampaign::Status] Status of a 10DLC campaign registration.
        #
        #   @param subscriber_help [Boolean]
        #
        #   @param subscriber_opt_in [Boolean]
        #
        #   @param subscriber_opt_out [Boolean]
        #
        #   @param updated_at [Time]
        #
        #   @param use_case [String] Campaign use case type.
        #
        #   @param approved_at [Time, nil]
        #
        #   @param daily_limit [Integer, nil] Daily message limit based on brand trust score.
        #
        #   @param failure_reason [String, nil]
        #
        #   @param help_message [String, nil]
        #
        #   @param message_flow [String, nil]
        #
        #   @param monthly_fee_cents [Integer, nil] Recurring monthly fee in cents.
        #
        #   @param opt_in_keywords [Array<String>, nil]
        #
        #   @param opt_out_keywords [Array<String>, nil]
        #
        #   @param registration_cost_cents [Integer, nil] One-time registration cost in cents.
        #
        #   @param submitted_at [Time, nil]
        #
        #   @param sub_use_cases [Array<String>, nil]

        # Status of a 10DLC campaign registration.
        #
        # @see Zavudev::Models::Number10dlc::TenDlcCampaign#status
        module Status
          extend Zavudev::Internal::Type::Enum

          DRAFT = :draft
          PENDING = :pending
          APPROVED = :approved
          REJECTED = :rejected

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
