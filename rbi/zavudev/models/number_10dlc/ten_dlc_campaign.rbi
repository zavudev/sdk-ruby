# typed: strong

module Zavudev
  module Models
    module Number10dlc
      class TenDlcCampaign < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Number10dlc::TenDlcCampaign,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T::Boolean) }
        attr_accessor :affiliate_marketing

        sig { returns(T::Boolean) }
        attr_accessor :age_gated

        # ID of the brand this campaign belongs to.
        sig { returns(String) }
        attr_accessor :brand_id

        sig { returns(Time) }
        attr_accessor :created_at

        # Description of the messaging campaign.
        sig { returns(String) }
        attr_accessor :description

        sig { returns(T::Boolean) }
        attr_accessor :direct_lending

        sig { returns(T::Boolean) }
        attr_accessor :embedded_link

        sig { returns(T::Boolean) }
        attr_accessor :embedded_phone

        sig { returns(String) }
        attr_accessor :name

        sig { returns(T::Boolean) }
        attr_accessor :number_pooling

        # Sample messages representative of campaign content.
        sig { returns(T::Array[String]) }
        attr_accessor :sample_messages

        # Status of a 10DLC campaign registration.
        sig do
          returns(Zavudev::Number10dlc::TenDlcCampaign::Status::TaggedSymbol)
        end
        attr_accessor :status

        sig { returns(T::Boolean) }
        attr_accessor :subscriber_help

        sig { returns(T::Boolean) }
        attr_accessor :subscriber_opt_in

        sig { returns(T::Boolean) }
        attr_accessor :subscriber_opt_out

        sig { returns(Time) }
        attr_accessor :updated_at

        # Campaign use case type.
        sig { returns(String) }
        attr_accessor :use_case

        sig { returns(T.nilable(Time)) }
        attr_accessor :approved_at

        # Daily message limit based on brand trust score.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :daily_limit

        sig { returns(T.nilable(String)) }
        attr_accessor :failure_reason

        sig { returns(T.nilable(String)) }
        attr_accessor :help_message

        sig { returns(T.nilable(String)) }
        attr_accessor :message_flow

        # Recurring monthly fee in cents.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :monthly_fee_cents

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :opt_in_keywords

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :opt_out_keywords

        # One-time registration cost in cents.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :registration_cost_cents

        sig { returns(T.nilable(Time)) }
        attr_accessor :submitted_at

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :sub_use_cases

        sig do
          params(
            id: String,
            affiliate_marketing: T::Boolean,
            age_gated: T::Boolean,
            brand_id: String,
            created_at: Time,
            description: String,
            direct_lending: T::Boolean,
            embedded_link: T::Boolean,
            embedded_phone: T::Boolean,
            name: String,
            number_pooling: T::Boolean,
            sample_messages: T::Array[String],
            status: Zavudev::Number10dlc::TenDlcCampaign::Status::OrSymbol,
            subscriber_help: T::Boolean,
            subscriber_opt_in: T::Boolean,
            subscriber_opt_out: T::Boolean,
            updated_at: Time,
            use_case: String,
            approved_at: T.nilable(Time),
            daily_limit: T.nilable(Integer),
            failure_reason: T.nilable(String),
            help_message: T.nilable(String),
            message_flow: T.nilable(String),
            monthly_fee_cents: T.nilable(Integer),
            opt_in_keywords: T.nilable(T::Array[String]),
            opt_out_keywords: T.nilable(T::Array[String]),
            registration_cost_cents: T.nilable(Integer),
            submitted_at: T.nilable(Time),
            sub_use_cases: T.nilable(T::Array[String])
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          affiliate_marketing:,
          age_gated:,
          # ID of the brand this campaign belongs to.
          brand_id:,
          created_at:,
          # Description of the messaging campaign.
          description:,
          direct_lending:,
          embedded_link:,
          embedded_phone:,
          name:,
          number_pooling:,
          # Sample messages representative of campaign content.
          sample_messages:,
          # Status of a 10DLC campaign registration.
          status:,
          subscriber_help:,
          subscriber_opt_in:,
          subscriber_opt_out:,
          updated_at:,
          # Campaign use case type.
          use_case:,
          approved_at: nil,
          # Daily message limit based on brand trust score.
          daily_limit: nil,
          failure_reason: nil,
          help_message: nil,
          message_flow: nil,
          # Recurring monthly fee in cents.
          monthly_fee_cents: nil,
          opt_in_keywords: nil,
          opt_out_keywords: nil,
          # One-time registration cost in cents.
          registration_cost_cents: nil,
          submitted_at: nil,
          sub_use_cases: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              affiliate_marketing: T::Boolean,
              age_gated: T::Boolean,
              brand_id: String,
              created_at: Time,
              description: String,
              direct_lending: T::Boolean,
              embedded_link: T::Boolean,
              embedded_phone: T::Boolean,
              name: String,
              number_pooling: T::Boolean,
              sample_messages: T::Array[String],
              status:
                Zavudev::Number10dlc::TenDlcCampaign::Status::TaggedSymbol,
              subscriber_help: T::Boolean,
              subscriber_opt_in: T::Boolean,
              subscriber_opt_out: T::Boolean,
              updated_at: Time,
              use_case: String,
              approved_at: T.nilable(Time),
              daily_limit: T.nilable(Integer),
              failure_reason: T.nilable(String),
              help_message: T.nilable(String),
              message_flow: T.nilable(String),
              monthly_fee_cents: T.nilable(Integer),
              opt_in_keywords: T.nilable(T::Array[String]),
              opt_out_keywords: T.nilable(T::Array[String]),
              registration_cost_cents: T.nilable(Integer),
              submitted_at: T.nilable(Time),
              sub_use_cases: T.nilable(T::Array[String])
            }
          )
        end
        def to_hash
        end

        # Status of a 10DLC campaign registration.
        module Status
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::Number10dlc::TenDlcCampaign::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DRAFT =
            T.let(
              :draft,
              Zavudev::Number10dlc::TenDlcCampaign::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Zavudev::Number10dlc::TenDlcCampaign::Status::TaggedSymbol
            )
          APPROVED =
            T.let(
              :approved,
              Zavudev::Number10dlc::TenDlcCampaign::Status::TaggedSymbol
            )
          REJECTED =
            T.let(
              :rejected,
              Zavudev::Number10dlc::TenDlcCampaign::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Number10dlc::TenDlcCampaign::Status::TaggedSymbol
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
