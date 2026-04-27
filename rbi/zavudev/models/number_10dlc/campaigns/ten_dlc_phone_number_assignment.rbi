# typed: strong

module Zavudev
  module Models
    module Number10dlc
      module Campaigns
        class TenDlcPhoneNumberAssignment < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :campaign_id

          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(String) }
          attr_accessor :phone_number_id

          # Assignment status.
          sig do
            returns(
              Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          sig { returns(Time) }
          attr_accessor :updated_at

          sig { returns(T.nilable(Time)) }
          attr_accessor :assigned_at

          sig { returns(T.nilable(String)) }
          attr_accessor :failure_reason

          sig do
            params(
              id: String,
              campaign_id: String,
              created_at: Time,
              phone_number_id: String,
              status:
                Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status::OrSymbol,
              updated_at: Time,
              assigned_at: T.nilable(Time),
              failure_reason: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            campaign_id:,
            created_at:,
            phone_number_id:,
            # Assignment status.
            status:,
            updated_at:,
            assigned_at: nil,
            failure_reason: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                campaign_id: String,
                created_at: Time,
                phone_number_id: String,
                status:
                  Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status::TaggedSymbol,
                updated_at: Time,
                assigned_at: T.nilable(Time),
                failure_reason: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Assignment status.
          module Status
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PENDING =
              T.let(
                :pending,
                Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status::TaggedSymbol
              )
            ACTIVE =
              T.let(
                :active,
                Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Number10dlc::Campaigns::TenDlcPhoneNumberAssignment::Status::TaggedSymbol
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
