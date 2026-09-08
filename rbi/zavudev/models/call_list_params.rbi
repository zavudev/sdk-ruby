# typed: strong

module Zavudev
  module Models
    class CallListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::CallListParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Whether the call was placed by Zavu (outbound) or received from a caller
      # (inbound).
      sig { returns(T.nilable(Zavudev::CallListParams::Direction::OrSymbol)) }
      attr_reader :direction

      sig do
        params(direction: Zavudev::CallListParams::Direction::OrSymbol).void
      end
      attr_writer :direction

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Lifecycle status of a voice call.
      #
      # - `queued`: outbound call created, not yet dialing.
      # - `ringing`: dialing (outbound) or received and ringing (inbound).
      # - `in_progress`: answered, the agent is connected.
      # - `completed`: ended after a conversation.
      # - `failed`: could not be completed.
      # - `busy`: the line was busy.
      # - `no_answer`: rang but was not answered.
      # - `canceled`: canceled before it was answered.
      sig { returns(T.nilable(Zavudev::CallListParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: Zavudev::CallListParams::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          cursor: String,
          direction: Zavudev::CallListParams::Direction::OrSymbol,
          limit: Integer,
          status: Zavudev::CallListParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        cursor: nil,
        # Whether the call was placed by Zavu (outbound) or received from a caller
        # (inbound).
        direction: nil,
        limit: nil,
        # Lifecycle status of a voice call.
        #
        # - `queued`: outbound call created, not yet dialing.
        # - `ringing`: dialing (outbound) or received and ringing (inbound).
        # - `in_progress`: answered, the agent is connected.
        # - `completed`: ended after a conversation.
        # - `failed`: could not be completed.
        # - `busy`: the line was busy.
        # - `no_answer`: rang but was not answered.
        # - `canceled`: canceled before it was answered.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            direction: Zavudev::CallListParams::Direction::OrSymbol,
            limit: Integer,
            status: Zavudev::CallListParams::Status::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether the call was placed by Zavu (outbound) or received from a caller
      # (inbound).
      module Direction
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::CallListParams::Direction) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND =
          T.let(:inbound, Zavudev::CallListParams::Direction::TaggedSymbol)
        OUTBOUND =
          T.let(:outbound, Zavudev::CallListParams::Direction::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::CallListParams::Direction::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Lifecycle status of a voice call.
      #
      # - `queued`: outbound call created, not yet dialing.
      # - `ringing`: dialing (outbound) or received and ringing (inbound).
      # - `in_progress`: answered, the agent is connected.
      # - `completed`: ended after a conversation.
      # - `failed`: could not be completed.
      # - `busy`: the line was busy.
      # - `no_answer`: rang but was not answered.
      # - `canceled`: canceled before it was answered.
      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::CallListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED = T.let(:queued, Zavudev::CallListParams::Status::TaggedSymbol)
        RINGING = T.let(:ringing, Zavudev::CallListParams::Status::TaggedSymbol)
        IN_PROGRESS =
          T.let(:in_progress, Zavudev::CallListParams::Status::TaggedSymbol)
        COMPLETED =
          T.let(:completed, Zavudev::CallListParams::Status::TaggedSymbol)
        FAILED = T.let(:failed, Zavudev::CallListParams::Status::TaggedSymbol)
        BUSY = T.let(:busy, Zavudev::CallListParams::Status::TaggedSymbol)
        NO_ANSWER =
          T.let(:no_answer, Zavudev::CallListParams::Status::TaggedSymbol)
        CANCELED =
          T.let(:canceled, Zavudev::CallListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::CallListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
