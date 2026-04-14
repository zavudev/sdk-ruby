# typed: strong

module Zavudev
  module Models
    class UsageRetrieveResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::UsageRetrieveResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # Emails sent this month.
      sig { returns(Integer) }
      attr_accessor :emails_sent

      sig { returns(Zavudev::Models::UsageRetrieveResponse::Limits) }
      attr_reader :limits

      sig do
        params(
          limits: Zavudev::Models::UsageRetrieveResponse::Limits::OrHash
        ).void
      end
      attr_writer :limits

      # A2P messages sent this month (WhatsApp replies + Telegram).
      sig { returns(Integer) }
      attr_accessor :messages_a2_p

      # Current month in YYYY-MM format.
      sig { returns(String) }
      attr_accessor :month_key

      sig do
        returns(Zavudev::Models::UsageRetrieveResponse::Tier::TaggedSymbol)
      end
      attr_accessor :tier

      sig do
        params(
          emails_sent: Integer,
          limits: Zavudev::Models::UsageRetrieveResponse::Limits::OrHash,
          messages_a2_p: Integer,
          month_key: String,
          tier: Zavudev::Models::UsageRetrieveResponse::Tier::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Emails sent this month.
        emails_sent:,
        limits:,
        # A2P messages sent this month (WhatsApp replies + Telegram).
        messages_a2_p:,
        # Current month in YYYY-MM format.
        month_key:,
        tier:
      )
      end

      sig do
        override.returns(
          {
            emails_sent: Integer,
            limits: Zavudev::Models::UsageRetrieveResponse::Limits,
            messages_a2_p: Integer,
            month_key: String,
            tier: Zavudev::Models::UsageRetrieveResponse::Tier::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Limits < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::UsageRetrieveResponse::Limits,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Integer)) }
        attr_reader :emails

        sig { params(emails: Integer).void }
        attr_writer :emails

        sig { returns(T.nilable(Integer)) }
        attr_reader :messages_a2_p

        sig { params(messages_a2_p: Integer).void }
        attr_writer :messages_a2_p

        sig do
          params(emails: Integer, messages_a2_p: Integer).returns(
            T.attached_class
          )
        end
        def self.new(emails: nil, messages_a2_p: nil)
        end

        sig { override.returns({ emails: Integer, messages_a2_p: Integer }) }
        def to_hash
        end
      end

      module Tier
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::Models::UsageRetrieveResponse::Tier)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FREE =
          T.let(
            :free,
            Zavudev::Models::UsageRetrieveResponse::Tier::TaggedSymbol
          )
        PRO =
          T.let(
            :pro,
            Zavudev::Models::UsageRetrieveResponse::Tier::TaggedSymbol
          )
        SCALE =
          T.let(
            :scale,
            Zavudev::Models::UsageRetrieveResponse::Tier::TaggedSymbol
          )
        ENTERPRISE =
          T.let(
            :enterprise,
            Zavudev::Models::UsageRetrieveResponse::Tier::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::Models::UsageRetrieveResponse::Tier::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
