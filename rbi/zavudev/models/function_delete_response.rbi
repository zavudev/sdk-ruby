# typed: strong

module Zavudev
  module Models
    class FunctionDeleteResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::FunctionDeleteResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(T::Boolean) }
      attr_accessor :deleted

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(String)) }
      attr_reader :slug

      sig { params(slug: String).void }
      attr_writer :slug

      sig do
        params(deleted: T::Boolean, name: String, slug: String).returns(
          T.attached_class
        )
      end
      def self.new(deleted:, name: nil, slug: nil)
      end

      sig do
        override.returns({ deleted: T::Boolean, name: String, slug: String })
      end
      def to_hash
      end
    end
  end
end
