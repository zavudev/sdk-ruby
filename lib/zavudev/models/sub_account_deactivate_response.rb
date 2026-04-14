# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::SubAccounts#deactivate
    class SubAccountDeactivateResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute keys_revoked
      #   Number of API keys revoked.
      #
      #   @return [Integer]
      required :keys_revoked, Integer, api_name: :keysRevoked

      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!method initialize(keys_revoked:, message:)
      #   @param keys_revoked [Integer] Number of API keys revoked.
      #
      #   @param message [String]
    end
  end
end
