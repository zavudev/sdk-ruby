# typed: strong

module Zavudev
  module Models
    module Broadcasts
      class ContactAddResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Broadcasts::ContactAddResponse,
              Zavudev::Internal::AnyHash
            )
          end

        # Number of contacts successfully added.
        sig { returns(Integer) }
        attr_accessor :added

        # Number of duplicate contacts skipped.
        sig { returns(Integer) }
        attr_accessor :duplicates

        # Number of invalid contacts rejected.
        sig { returns(Integer) }
        attr_accessor :invalid

        # Details about invalid contacts.
        sig do
          returns(
            T.nilable(
              T::Array[Zavudev::Models::Broadcasts::ContactAddResponse::Error]
            )
          )
        end
        attr_reader :errors

        sig do
          params(
            errors:
              T::Array[
                Zavudev::Models::Broadcasts::ContactAddResponse::Error::OrHash
              ]
          ).void
        end
        attr_writer :errors

        sig do
          params(
            added: Integer,
            duplicates: Integer,
            invalid: Integer,
            errors:
              T::Array[
                Zavudev::Models::Broadcasts::ContactAddResponse::Error::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of contacts successfully added.
          added:,
          # Number of duplicate contacts skipped.
          duplicates:,
          # Number of invalid contacts rejected.
          invalid:,
          # Details about invalid contacts.
          errors: nil
        )
        end

        sig do
          override.returns(
            {
              added: Integer,
              duplicates: Integer,
              invalid: Integer,
              errors:
                T::Array[Zavudev::Models::Broadcasts::ContactAddResponse::Error]
            }
          )
        end
        def to_hash
        end

        class Error < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Broadcasts::ContactAddResponse::Error,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :reason

          sig { params(reason: String).void }
          attr_writer :reason

          sig { returns(T.nilable(String)) }
          attr_reader :recipient

          sig { params(recipient: String).void }
          attr_writer :recipient

          sig do
            params(reason: String, recipient: String).returns(T.attached_class)
          end
          def self.new(reason: nil, recipient: nil)
          end

          sig { override.returns({ reason: String, recipient: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
