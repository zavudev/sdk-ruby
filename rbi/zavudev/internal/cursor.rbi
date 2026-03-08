# typed: strong

module Zavudev
  module Internal
    class Cursor
      include Zavudev::Internal::Type::BasePage

      Elem = type_member

      sig { returns(T.nilable(T::Array[Elem])) }
      attr_accessor :items

      sig { returns(String) }
      attr_accessor :next_cursor

      # @api private
      sig { returns(String) }
      def inspect
      end
    end
  end
end
