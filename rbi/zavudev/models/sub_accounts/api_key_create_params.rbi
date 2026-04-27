# typed: strong

module Zavudev
  module Models
    module SubAccounts
      class APIKeyCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::SubAccounts::APIKeyCreateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            T.nilable(
              Zavudev::SubAccounts::APIKeyCreateParams::Environment::OrSymbol
            )
          )
        end
        attr_reader :environment

        sig do
          params(
            environment:
              Zavudev::SubAccounts::APIKeyCreateParams::Environment::OrSymbol
          ).void
        end
        attr_writer :environment

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :permissions

        sig { params(permissions: T::Array[String]).void }
        attr_writer :permissions

        sig do
          params(
            id: String,
            name: String,
            environment:
              Zavudev::SubAccounts::APIKeyCreateParams::Environment::OrSymbol,
            permissions: T::Array[String],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          name:,
          environment: nil,
          permissions: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              name: String,
              environment:
                Zavudev::SubAccounts::APIKeyCreateParams::Environment::OrSymbol,
              permissions: T::Array[String],
              request_options: Zavudev::RequestOptions
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
                Zavudev::SubAccounts::APIKeyCreateParams::Environment
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LIVE =
            T.let(
              :live,
              Zavudev::SubAccounts::APIKeyCreateParams::Environment::TaggedSymbol
            )
          TEST =
            T.let(
              :test,
              Zavudev::SubAccounts::APIKeyCreateParams::Environment::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::SubAccounts::APIKeyCreateParams::Environment::TaggedSymbol
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
