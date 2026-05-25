# typed: strong

module Zavudev
  module Models
    module Functions
      class SecretListResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Functions::SecretListResponse,
              Zavudev::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[Zavudev::Models::Functions::SecretListResponse::Secret]
          )
        end
        attr_accessor :secrets

        sig do
          params(
            secrets:
              T::Array[
                Zavudev::Models::Functions::SecretListResponse::Secret::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(secrets:)
        end

        sig do
          override.returns(
            {
              secrets:
                T::Array[Zavudev::Models::Functions::SecretListResponse::Secret]
            }
          )
        end
        def to_hash
        end

        class Secret < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Functions::SecretListResponse::Secret,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :key

          sig { returns(String) }
          attr_accessor :value_last4

          sig { returns(T.nilable(Float)) }
          attr_reader :created_at

          sig { params(created_at: Float).void }
          attr_writer :created_at

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :synced_to_aws

          sig { params(synced_to_aws: T::Boolean).void }
          attr_writer :synced_to_aws

          sig { returns(T.nilable(Float)) }
          attr_reader :updated_at

          sig { params(updated_at: Float).void }
          attr_writer :updated_at

          sig do
            params(
              id: String,
              key: String,
              value_last4: String,
              created_at: Float,
              synced_to_aws: T::Boolean,
              updated_at: Float
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            key:,
            value_last4:,
            created_at: nil,
            synced_to_aws: nil,
            updated_at: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                key: String,
                value_last4: String,
                created_at: Float,
                synced_to_aws: T::Boolean,
                updated_at: Float
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
