# typed: strong

module Zavudev
  module Models
    class PlanRetrieveResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::PlanRetrieveResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig do
        returns(
          Zavudev::Models::PlanRetrieveResponse::BillingInterval::TaggedSymbol
        )
      end
      attr_accessor :billing_interval

      sig do
        returns(Zavudev::Models::PlanRetrieveResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Current subscription tier.
      sig { returns(Zavudev::Models::PlanRetrieveResponse::Tier::TaggedSymbol) }
      attr_accessor :tier

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :cancel_at_period_end

      sig { params(cancel_at_period_end: T::Boolean).void }
      attr_writer :cancel_at_period_end

      sig { returns(T.nilable(Time)) }
      attr_reader :current_period_end

      sig { params(current_period_end: Time).void }
      attr_writer :current_period_end

      sig { returns(T.nilable(Time)) }
      attr_reader :current_period_start

      sig { params(current_period_start: Time).void }
      attr_writer :current_period_start

      sig { returns(T.nilable(Zavudev::Models::PlanRetrieveResponse::Limits)) }
      attr_reader :limits

      sig do
        params(
          limits: Zavudev::Models::PlanRetrieveResponse::Limits::OrHash
        ).void
      end
      attr_writer :limits

      sig do
        params(
          billing_interval:
            Zavudev::Models::PlanRetrieveResponse::BillingInterval::OrSymbol,
          status: Zavudev::Models::PlanRetrieveResponse::Status::OrSymbol,
          tier: Zavudev::Models::PlanRetrieveResponse::Tier::OrSymbol,
          cancel_at_period_end: T::Boolean,
          current_period_end: Time,
          current_period_start: Time,
          limits: Zavudev::Models::PlanRetrieveResponse::Limits::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        billing_interval:,
        status:,
        # Current subscription tier.
        tier:,
        cancel_at_period_end: nil,
        current_period_end: nil,
        current_period_start: nil,
        limits: nil
      )
      end

      sig do
        override.returns(
          {
            billing_interval:
              Zavudev::Models::PlanRetrieveResponse::BillingInterval::TaggedSymbol,
            status: Zavudev::Models::PlanRetrieveResponse::Status::TaggedSymbol,
            tier: Zavudev::Models::PlanRetrieveResponse::Tier::TaggedSymbol,
            cancel_at_period_end: T::Boolean,
            current_period_end: Time,
            current_period_start: Time,
            limits: Zavudev::Models::PlanRetrieveResponse::Limits
          }
        )
      end
      def to_hash
      end

      module BillingInterval
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Zavudev::Models::PlanRetrieveResponse::BillingInterval
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MONTHLY =
          T.let(
            :monthly,
            Zavudev::Models::PlanRetrieveResponse::BillingInterval::TaggedSymbol
          )
        ANNUAL =
          T.let(
            :annual,
            Zavudev::Models::PlanRetrieveResponse::BillingInterval::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Zavudev::Models::PlanRetrieveResponse::BillingInterval::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::Models::PlanRetrieveResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(
            :active,
            Zavudev::Models::PlanRetrieveResponse::Status::TaggedSymbol
          )
        PAST_DUE =
          T.let(
            :past_due,
            Zavudev::Models::PlanRetrieveResponse::Status::TaggedSymbol
          )
        CANCELED =
          T.let(
            :canceled,
            Zavudev::Models::PlanRetrieveResponse::Status::TaggedSymbol
          )
        TRIALING =
          T.let(
            :trialing,
            Zavudev::Models::PlanRetrieveResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Zavudev::Models::PlanRetrieveResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Current subscription tier.
      module Tier
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::Models::PlanRetrieveResponse::Tier)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FREE =
          T.let(
            :free,
            Zavudev::Models::PlanRetrieveResponse::Tier::TaggedSymbol
          )
        PRO =
          T.let(:pro, Zavudev::Models::PlanRetrieveResponse::Tier::TaggedSymbol)
        SCALE =
          T.let(
            :scale,
            Zavudev::Models::PlanRetrieveResponse::Tier::TaggedSymbol
          )
        ENTERPRISE =
          T.let(
            :enterprise,
            Zavudev::Models::PlanRetrieveResponse::Tier::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::Models::PlanRetrieveResponse::Tier::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Limits < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::PlanRetrieveResponse::Limits,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :broadcasts

        sig { params(broadcasts: T::Boolean).void }
        attr_writer :broadcasts

        # Monthly email limit.
        sig { returns(T.nilable(Integer)) }
        attr_reader :emails

        sig { params(emails: Integer).void }
        attr_writer :emails

        # Monthly A2P message limit.
        sig { returns(T.nilable(Integer)) }
        attr_reader :messages_a2_p

        sig { params(messages_a2_p: Integer).void }
        attr_writer :messages_a2_p

        sig { returns(T.nilable(Integer)) }
        attr_reader :phone_numbers

        sig { params(phone_numbers: Integer).void }
        attr_writer :phone_numbers

        sig { returns(T.nilable(Integer)) }
        attr_reader :senders

        sig { params(senders: Integer).void }
        attr_writer :senders

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sub_accounts

        sig { params(sub_accounts: T::Boolean).void }
        attr_writer :sub_accounts

        sig { returns(T.nilable(Integer)) }
        attr_reader :waba_connections

        sig { params(waba_connections: Integer).void }
        attr_writer :waba_connections

        sig do
          params(
            broadcasts: T::Boolean,
            emails: Integer,
            messages_a2_p: Integer,
            phone_numbers: Integer,
            senders: Integer,
            sub_accounts: T::Boolean,
            waba_connections: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          broadcasts: nil,
          # Monthly email limit.
          emails: nil,
          # Monthly A2P message limit.
          messages_a2_p: nil,
          phone_numbers: nil,
          senders: nil,
          sub_accounts: nil,
          waba_connections: nil
        )
        end

        sig do
          override.returns(
            {
              broadcasts: T::Boolean,
              emails: Integer,
              messages_a2_p: Integer,
              phone_numbers: Integer,
              senders: Integer,
              sub_accounts: T::Boolean,
              waba_connections: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
