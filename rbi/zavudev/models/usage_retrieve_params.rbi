# typed: strong

module Zavudev
  module Models
    class UsageRetrieveParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::UsageRetrieveParams, Zavudev::Internal::AnyHash)
        end

      sig do
        params(request_options: Zavudev::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Zavudev::RequestOptions }) }
      def to_hash
      end
    end
  end
end
