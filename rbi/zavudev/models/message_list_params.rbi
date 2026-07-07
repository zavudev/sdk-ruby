# typed: strong

module Zavudev
  module Models
    class MessageListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::MessageListParams, Zavudev::Internal::AnyHash)
        end

      # Filter by delivery channel.
      sig { returns(T.nilable(Zavudev::MessageListParams::Channel::OrSymbol)) }
      attr_reader :channel

      sig do
        params(channel: Zavudev::MessageListParams::Channel::OrSymbol).void
      end
      attr_writer :channel

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter by status. Not all stored statuses are filterable.
      sig { returns(T.nilable(Zavudev::MessageListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: Zavudev::MessageListParams::Status::OrSymbol).void }
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :to

      sig { params(to: String).void }
      attr_writer :to

      sig do
        params(
          channel: Zavudev::MessageListParams::Channel::OrSymbol,
          cursor: String,
          limit: Integer,
          status: Zavudev::MessageListParams::Status::OrSymbol,
          to: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter by delivery channel.
        channel: nil,
        cursor: nil,
        limit: nil,
        # Filter by status. Not all stored statuses are filterable.
        status: nil,
        to: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            channel: Zavudev::MessageListParams::Channel::OrSymbol,
            cursor: String,
            limit: Integer,
            status: Zavudev::MessageListParams::Status::OrSymbol,
            to: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by delivery channel.
      module Channel
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::MessageListParams::Channel) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SMS = T.let(:sms, Zavudev::MessageListParams::Channel::TaggedSymbol)
        SMS_ONEWAY =
          T.let(:sms_oneway, Zavudev::MessageListParams::Channel::TaggedSymbol)
        WHATSAPP =
          T.let(:whatsapp, Zavudev::MessageListParams::Channel::TaggedSymbol)
        EMAIL = T.let(:email, Zavudev::MessageListParams::Channel::TaggedSymbol)
        TELEGRAM =
          T.let(:telegram, Zavudev::MessageListParams::Channel::TaggedSymbol)
        INSTAGRAM =
          T.let(:instagram, Zavudev::MessageListParams::Channel::TaggedSymbol)
        MESSENGER =
          T.let(:messenger, Zavudev::MessageListParams::Channel::TaggedSymbol)
        VOICE = T.let(:voice, Zavudev::MessageListParams::Channel::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::MessageListParams::Channel::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter by status. Not all stored statuses are filterable.
      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::MessageListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(:queued, Zavudev::MessageListParams::Status::TaggedSymbol)
        SENDING =
          T.let(:sending, Zavudev::MessageListParams::Status::TaggedSymbol)
        SENT = T.let(:sent, Zavudev::MessageListParams::Status::TaggedSymbol)
        DELIVERED =
          T.let(:delivered, Zavudev::MessageListParams::Status::TaggedSymbol)
        FAILED =
          T.let(:failed, Zavudev::MessageListParams::Status::TaggedSymbol)
        RECEIVED =
          T.let(:received, Zavudev::MessageListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::MessageListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
