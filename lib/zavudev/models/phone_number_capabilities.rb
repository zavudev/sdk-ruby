# frozen_string_literal: true

module Zavudev
  module Models
    class PhoneNumberCapabilities < Zavudev::Internal::Type::BaseModel
      # @!attribute mms
      #
      #   @return [Boolean, nil]
      optional :mms, Zavudev::Internal::Type::Boolean

      # @!attribute sms
      #
      #   @return [Boolean, nil]
      optional :sms, Zavudev::Internal::Type::Boolean

      # @!attribute voice
      #
      #   @return [Boolean, nil]
      optional :voice, Zavudev::Internal::Type::Boolean

      # @!method initialize(mms: nil, sms: nil, voice: nil)
      #   @param mms [Boolean]
      #   @param sms [Boolean]
      #   @param voice [Boolean]
    end
  end
end
