# typed: strong

module Zavudev
  module Models
    class SubAccountDeactivateResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::SubAccountDeactivateResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # Number of API keys revoked.
      sig { returns(Integer) }
      attr_accessor :keys_revoked

      sig { returns(String) }
      attr_accessor :message

      sig do
        params(keys_revoked: Integer, message: String).returns(T.attached_class)
      end
      def self.new(
        # Number of API keys revoked.
        keys_revoked:,
        message:
      )
      end

      sig { override.returns({ keys_revoked: Integer, message: String }) }
      def to_hash
      end
    end
  end
end
