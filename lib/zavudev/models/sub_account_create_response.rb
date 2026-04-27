# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::SubAccounts#create
    class SubAccountCreateResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute sub_account
      #
      #   @return [Zavudev::Models::SubAccount]
      required :sub_account, -> { Zavudev::SubAccount }, api_name: :subAccount

      # @!method initialize(sub_account:)
      #   @param sub_account [Zavudev::Models::SubAccount]
    end
  end
end
