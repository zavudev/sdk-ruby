# typed: strong

module Zavudev
  module Models
    class ContactChannel < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::ContactChannel, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Channel type.
      sig { returns(Zavudev::ContactChannel::Channel::TaggedSymbol) }
      attr_accessor :channel

      sig { returns(Time) }
      attr_accessor :created_at

      # Channel identifier (phone number or email address).
      sig { returns(String) }
      attr_accessor :identifier

      # Whether this is the primary channel for its type.
      sig { returns(T::Boolean) }
      attr_accessor :is_primary

      # Whether this channel has been verified.
      sig { returns(T::Boolean) }
      attr_accessor :verified

      # ISO country code for phone numbers.
      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      # Optional label for the channel.
      sig { returns(T.nilable(String)) }
      attr_reader :label

      sig { params(label: String).void }
      attr_writer :label

      # Last time a message was received on this channel.
      sig { returns(T.nilable(Time)) }
      attr_reader :last_inbound_at

      sig { params(last_inbound_at: Time).void }
      attr_writer :last_inbound_at

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Delivery metrics for this channel.
      sig { returns(T.nilable(Zavudev::ContactChannel::Metrics)) }
      attr_reader :metrics

      sig { params(metrics: Zavudev::ContactChannel::Metrics::OrHash).void }
      attr_writer :metrics

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # A communication channel for a contact.
      sig do
        params(
          id: String,
          channel: Zavudev::ContactChannel::Channel::OrSymbol,
          created_at: Time,
          identifier: String,
          is_primary: T::Boolean,
          verified: T::Boolean,
          country_code: String,
          label: String,
          last_inbound_at: Time,
          metadata: T::Hash[Symbol, String],
          metrics: Zavudev::ContactChannel::Metrics::OrHash,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Channel type.
        channel:,
        created_at:,
        # Channel identifier (phone number or email address).
        identifier:,
        # Whether this is the primary channel for its type.
        is_primary:,
        # Whether this channel has been verified.
        verified:,
        # ISO country code for phone numbers.
        country_code: nil,
        # Optional label for the channel.
        label: nil,
        # Last time a message was received on this channel.
        last_inbound_at: nil,
        metadata: nil,
        # Delivery metrics for this channel.
        metrics: nil,
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            channel: Zavudev::ContactChannel::Channel::TaggedSymbol,
            created_at: Time,
            identifier: String,
            is_primary: T::Boolean,
            verified: T::Boolean,
            country_code: String,
            label: String,
            last_inbound_at: Time,
            metadata: T::Hash[Symbol, String],
            metrics: Zavudev::ContactChannel::Metrics,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      # Channel type.
      module Channel
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::ContactChannel::Channel) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SMS = T.let(:sms, Zavudev::ContactChannel::Channel::TaggedSymbol)
        WHATSAPP =
          T.let(:whatsapp, Zavudev::ContactChannel::Channel::TaggedSymbol)
        EMAIL = T.let(:email, Zavudev::ContactChannel::Channel::TaggedSymbol)
        TELEGRAM =
          T.let(:telegram, Zavudev::ContactChannel::Channel::TaggedSymbol)
        VOICE = T.let(:voice, Zavudev::ContactChannel::Channel::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::ContactChannel::Channel::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Metrics < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::ContactChannel::Metrics, Zavudev::Internal::AnyHash)
          end

        sig { returns(T.nilable(Float)) }
        attr_reader :avg_delivery_time_ms

        sig { params(avg_delivery_time_ms: Float).void }
        attr_writer :avg_delivery_time_ms

        sig { returns(T.nilable(Integer)) }
        attr_reader :failure_count

        sig { params(failure_count: Integer).void }
        attr_writer :failure_count

        sig { returns(T.nilable(Time)) }
        attr_reader :last_success_at

        sig { params(last_success_at: Time).void }
        attr_writer :last_success_at

        sig { returns(T.nilable(Integer)) }
        attr_reader :success_count

        sig { params(success_count: Integer).void }
        attr_writer :success_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :total_attempts

        sig { params(total_attempts: Integer).void }
        attr_writer :total_attempts

        # Delivery metrics for this channel.
        sig do
          params(
            avg_delivery_time_ms: Float,
            failure_count: Integer,
            last_success_at: Time,
            success_count: Integer,
            total_attempts: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          avg_delivery_time_ms: nil,
          failure_count: nil,
          last_success_at: nil,
          success_count: nil,
          total_attempts: nil
        )
        end

        sig do
          override.returns(
            {
              avg_delivery_time_ms: Float,
              failure_count: Integer,
              last_success_at: Time,
              success_count: Integer,
              total_attempts: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
