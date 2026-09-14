# typed: strong

module Zavudev
  module Models
    class FunctionListEventTypesResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::FunctionListEventTypesResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(T::Array[String]) }
      attr_accessor :events

      sig { params(events: T::Array[String]).returns(T.attached_class) }
      def self.new(events:)
      end

      sig { override.returns({ events: T::Array[String] }) }
      def to_hash
      end
    end
  end
end
