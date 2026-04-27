# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class BrandListUseCasesResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Number10dlc::BrandListUseCasesResponse,
              Zavudev::Internal::AnyHash
            )
          end

        sig do
          returns(
            T::Array[
              Zavudev::Models::Number10dlc::BrandListUseCasesResponse::UseCase
            ]
          )
        end
        attr_accessor :use_cases

        sig do
          params(
            use_cases:
              T::Array[
                Zavudev::Models::Number10dlc::BrandListUseCasesResponse::UseCase::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(use_cases:)
        end

        sig do
          override.returns(
            {
              use_cases:
                T::Array[
                  Zavudev::Models::Number10dlc::BrandListUseCasesResponse::UseCase
                ]
            }
          )
        end
        def to_hash
        end

        class UseCase < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Number10dlc::BrandListUseCasesResponse::UseCase,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            params(description: String, name: String).returns(T.attached_class)
          end
          def self.new(description: nil, name: nil)
          end

          sig { override.returns({ description: String, name: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
