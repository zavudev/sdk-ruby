# typed: strong

module Zavudev
  module Models
    module SubAccounts
      class APIKeyCreateResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::SubAccounts::APIKeyCreateResponse,
              Zavudev::Internal::AnyHash
            )
          end

        sig do
          returns(Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey)
        end
        attr_reader :api_key

        sig do
          params(
            api_key:
              Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::OrHash
          ).void
        end
        attr_writer :api_key

        sig do
          params(
            api_key:
              Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::OrHash
          ).returns(T.attached_class)
        end
        def self.new(api_key:)
        end

        sig do
          override.returns(
            {
              api_key:
                Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey
            }
          )
        end
        def to_hash
        end

        class APIKey < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment::TaggedSymbol
            )
          end
          attr_accessor :environment

          sig { returns(String) }
          attr_accessor :key

          sig { returns(String) }
          attr_accessor :name

          sig do
            params(
              id: String,
              environment:
                Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment::OrSymbol,
              key: String,
              name: String
            ).returns(T.attached_class)
          end
          def self.new(id:, environment:, key:, name:)
          end

          sig do
            override.returns(
              {
                id: String,
                environment:
                  Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment::TaggedSymbol,
                key: String,
                name: String
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
                  Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LIVE =
              T.let(
                :live,
                Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment::TaggedSymbol
              )
            TEST =
              T.let(
                :test,
                Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment::TaggedSymbol
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
