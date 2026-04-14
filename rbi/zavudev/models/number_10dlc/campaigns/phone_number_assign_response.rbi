# typed: strong

module Zavudev
  module Models
    module Number10dlc
      module Campaigns
        class PhoneNumberAssignResponse < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Number10dlc::Campaigns::PhoneNumberAssignResponse,
                Zavudev::Internal::AnyHash
              )
            end

          sig do
            returns(
              Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment
            )
          end
          attr_reader :assignment

          sig do
            params(
              assignment:
                Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::OrHash
            ).void
          end
          attr_writer :assignment

          sig do
            params(
              assignment:
                Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::OrHash
            ).returns(T.attached_class)
          end
          def self.new(assignment:)
          end

          sig do
            override.returns(
              {
                assignment:
                  Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment
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
