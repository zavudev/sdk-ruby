# typed: strong

module Zavudev
  module Models
    module Number10dlc
      module Campaigns
        class PhoneNumberListResponse < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Number10dlc::Campaigns::PhoneNumberListResponse,
                Zavudev::Internal::AnyHash
              )
            end

          sig do
            returns(
              T::Array[
                Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment
              ]
            )
          end
          attr_accessor :items

          sig { returns(T.nilable(String)) }
          attr_accessor :next_cursor

          sig do
            params(
              items:
                T::Array[
                  Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::OrHash
                ],
              next_cursor: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(items:, next_cursor: nil)
          end

          sig do
            override.returns(
              {
                items:
                  T::Array[
                    Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment
                  ],
                next_cursor: T.nilable(String)
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
