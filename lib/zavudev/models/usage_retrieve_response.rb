# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Usage#retrieve
    class UsageRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute emails_sent
      #   Emails sent this month.
      #
      #   @return [Integer]
      required :emails_sent, Integer, api_name: :emailsSent

      # @!attribute limits
      #
      #   @return [Zavudev::Models::UsageRetrieveResponse::Limits]
      required :limits, -> { Zavudev::Models::UsageRetrieveResponse::Limits }

      # @!attribute messages_a2_p
      #   A2P messages sent this month (WhatsApp replies + Telegram).
      #
      #   @return [Integer]
      required :messages_a2_p, Integer, api_name: :messagesA2P

      # @!attribute month_key
      #   Current month in YYYY-MM format.
      #
      #   @return [String]
      required :month_key, String, api_name: :monthKey

      # @!attribute tier
      #
      #   @return [Symbol, Zavudev::Models::UsageRetrieveResponse::Tier]
      required :tier, enum: -> { Zavudev::Models::UsageRetrieveResponse::Tier }

      # @!method initialize(emails_sent:, limits:, messages_a2_p:, month_key:, tier:)
      #   @param emails_sent [Integer] Emails sent this month.
      #
      #   @param limits [Zavudev::Models::UsageRetrieveResponse::Limits]
      #
      #   @param messages_a2_p [Integer] A2P messages sent this month (WhatsApp replies + Telegram).
      #
      #   @param month_key [String] Current month in YYYY-MM format.
      #
      #   @param tier [Symbol, Zavudev::Models::UsageRetrieveResponse::Tier]

      # @see Zavudev::Models::UsageRetrieveResponse#limits
      class Limits < Zavudev::Internal::Type::BaseModel
        # @!attribute emails
        #
        #   @return [Integer, nil]
        optional :emails, Integer

        # @!attribute messages_a2_p
        #
        #   @return [Integer, nil]
        optional :messages_a2_p, Integer, api_name: :messagesA2P

        # @!method initialize(emails: nil, messages_a2_p: nil)
        #   @param emails [Integer]
        #   @param messages_a2_p [Integer]
      end

      # @see Zavudev::Models::UsageRetrieveResponse#tier
      module Tier
        extend Zavudev::Internal::Type::Enum

        FREE = :free
        PRO = :pro
        SCALE = :scale
        ENTERPRISE = :enterprise

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
