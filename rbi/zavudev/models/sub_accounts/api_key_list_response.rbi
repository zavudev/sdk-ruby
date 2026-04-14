# typed: strong

module Zavudev
  module Models
    module SubAccounts
      class APIKeyListResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::SubAccounts::APIKeyListResponse,
              Zavudev::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[Zavudev::Models::SubAccounts::APIKeyListResponse::Item]
          )
        end
        attr_accessor :items

        sig do
          params(
            items:
              T::Array[
                Zavudev::Models::SubAccounts::APIKeyListResponse::Item::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(items:)
        end

        sig do
          override.returns(
            {
              items:
                T::Array[Zavudev::Models::SubAccounts::APIKeyListResponse::Item]
            }
          )
        end
        def to_hash
        end

        class Item < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::SubAccounts::APIKeyListResponse::Item,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Float) }
          attr_accessor :created_at

          sig do
            returns(
              Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment::TaggedSymbol
            )
          end
          attr_accessor :environment

          # First characters of the key for identification.
          sig { returns(String) }
          attr_accessor :key_prefix

          sig { returns(String) }
          attr_accessor :name

          # Full API key. Only returned on creation.
          sig { returns(T.nilable(String)) }
          attr_reader :key

          sig { params(key: String).void }
          attr_writer :key

          sig { returns(T.nilable(Float)) }
          attr_accessor :last_used_at

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :permissions

          sig { params(permissions: T::Array[String]).void }
          attr_writer :permissions

          sig { returns(T.nilable(Float)) }
          attr_accessor :revoked_at

          sig do
            params(
              id: String,
              created_at: Float,
              environment:
                Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment::OrSymbol,
              key_prefix: String,
              name: String,
              key: String,
              last_used_at: T.nilable(Float),
              permissions: T::Array[String],
              revoked_at: T.nilable(Float)
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            created_at:,
            environment:,
            # First characters of the key for identification.
            key_prefix:,
            name:,
            # Full API key. Only returned on creation.
            key: nil,
            last_used_at: nil,
            permissions: nil,
            revoked_at: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Float,
                environment:
                  Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment::TaggedSymbol,
                key_prefix: String,
                name: String,
                key: String,
                last_used_at: T.nilable(Float),
                permissions: T::Array[String],
                revoked_at: T.nilable(Float)
              }
            )
          end
          def to_hash
          end

          module Environment
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LIVE =
              T.let(
                :live,
                Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment::TaggedSymbol
              )
            TEST =
              T.let(
                :test,
                Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
