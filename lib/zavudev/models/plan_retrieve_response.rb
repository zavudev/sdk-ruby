# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Plan#retrieve
    class PlanRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute billing_interval
      #
      #   @return [Symbol, Zavudev::Models::PlanRetrieveResponse::BillingInterval]
      required :billing_interval,
               enum: -> { Zavudev::Models::PlanRetrieveResponse::BillingInterval },
               api_name: :billingInterval

      # @!attribute status
      #
      #   @return [Symbol, Zavudev::Models::PlanRetrieveResponse::Status]
      required :status, enum: -> { Zavudev::Models::PlanRetrieveResponse::Status }

      # @!attribute tier
      #   Current subscription tier.
      #
      #   @return [Symbol, Zavudev::Models::PlanRetrieveResponse::Tier]
      required :tier, enum: -> { Zavudev::Models::PlanRetrieveResponse::Tier }

      # @!attribute cancel_at_period_end
      #
      #   @return [Boolean, nil]
      optional :cancel_at_period_end, Zavudev::Internal::Type::Boolean, api_name: :cancelAtPeriodEnd

      # @!attribute current_period_end
      #
      #   @return [Time, nil]
      optional :current_period_end, Time, api_name: :currentPeriodEnd

      # @!attribute current_period_start
      #
      #   @return [Time, nil]
      optional :current_period_start, Time, api_name: :currentPeriodStart

      # @!attribute limits
      #
      #   @return [Zavudev::Models::PlanRetrieveResponse::Limits, nil]
      optional :limits, -> { Zavudev::Models::PlanRetrieveResponse::Limits }

      # @!method initialize(billing_interval:, status:, tier:, cancel_at_period_end: nil, current_period_end: nil, current_period_start: nil, limits: nil)
      #   @param billing_interval [Symbol, Zavudev::Models::PlanRetrieveResponse::BillingInterval]
      #
      #   @param status [Symbol, Zavudev::Models::PlanRetrieveResponse::Status]
      #
      #   @param tier [Symbol, Zavudev::Models::PlanRetrieveResponse::Tier] Current subscription tier.
      #
      #   @param cancel_at_period_end [Boolean]
      #
      #   @param current_period_end [Time]
      #
      #   @param current_period_start [Time]
      #
      #   @param limits [Zavudev::Models::PlanRetrieveResponse::Limits]

      # @see Zavudev::Models::PlanRetrieveResponse#billing_interval
      module BillingInterval
        extend Zavudev::Internal::Type::Enum

        MONTHLY = :monthly
        ANNUAL = :annual

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Zavudev::Models::PlanRetrieveResponse#status
      module Status
        extend Zavudev::Internal::Type::Enum

        ACTIVE = :active
        PAST_DUE = :past_due
        CANCELED = :canceled
        TRIALING = :trialing

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Current subscription tier.
      #
      # @see Zavudev::Models::PlanRetrieveResponse#tier
      module Tier
        extend Zavudev::Internal::Type::Enum

        FREE = :free
        PRO = :pro
        SCALE = :scale
        ENTERPRISE = :enterprise

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Zavudev::Models::PlanRetrieveResponse#limits
      class Limits < Zavudev::Internal::Type::BaseModel
        # @!attribute broadcasts
        #
        #   @return [Boolean, nil]
        optional :broadcasts, Zavudev::Internal::Type::Boolean

        # @!attribute emails
        #   Monthly email limit.
        #
        #   @return [Integer, nil]
        optional :emails, Integer

        # @!attribute messages_a2_p
        #   Monthly A2P message limit.
        #
        #   @return [Integer, nil]
        optional :messages_a2_p, Integer, api_name: :messagesA2P

        # @!attribute phone_numbers
        #
        #   @return [Integer, nil]
        optional :phone_numbers, Integer, api_name: :phoneNumbers

        # @!attribute senders
        #
        #   @return [Integer, nil]
        optional :senders, Integer

        # @!attribute sub_accounts
        #
        #   @return [Boolean, nil]
        optional :sub_accounts, Zavudev::Internal::Type::Boolean, api_name: :subAccounts

        # @!attribute waba_connections
        #
        #   @return [Integer, nil]
        optional :waba_connections, Integer, api_name: :wabaConnections

        # @!method initialize(broadcasts: nil, emails: nil, messages_a2_p: nil, phone_numbers: nil, senders: nil, sub_accounts: nil, waba_connections: nil)
        #   @param broadcasts [Boolean]
        #
        #   @param emails [Integer] Monthly email limit.
        #
        #   @param messages_a2_p [Integer] Monthly A2P message limit.
        #
        #   @param phone_numbers [Integer]
        #
        #   @param senders [Integer]
        #
        #   @param sub_accounts [Boolean]
        #
        #   @param waba_connections [Integer]
      end
    end
  end
end
