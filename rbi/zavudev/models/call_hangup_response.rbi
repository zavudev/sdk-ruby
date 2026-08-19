# typed: strong

module Zavudev
  module Models
    class CallHangupResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::Models::CallHangupResponse, Zavudev::Internal::AnyHash)
        end

      sig { returns(Zavudev::Models::CallHangupResponse::Call) }
      attr_reader :call

      sig do
        params(call: Zavudev::Models::CallHangupResponse::Call::OrHash).void
      end
      attr_writer :call

      sig do
        params(call: Zavudev::Models::CallHangupResponse::Call::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(call:)
      end

      sig do
        override.returns({ call: Zavudev::Models::CallHangupResponse::Call })
      end
      def to_hash
      end

      class Call < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::CallHangupResponse::Call,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        # Whether the call was placed by Zavu (outbound) or received from a caller
        # (inbound).
        sig do
          returns(
            Zavudev::Models::CallHangupResponse::Call::Direction::TaggedSymbol
          )
        end
        attr_accessor :direction

        # Caller phone number in E.164 format. Your sender's number for outbound calls;
        # the caller's number for inbound calls.
        sig { returns(String) }
        attr_accessor :from

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
        sig do
          returns(
            Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Callee phone number in E.164 format.
        sig { returns(String) }
        attr_accessor :to

        # When the call was answered.
        sig { returns(T.nilable(Time)) }
        attr_accessor :answered_at

        # Total cost of the call in USD, combining the managed voice pipeline per-minute
        # charge and telephony. Available once the call has ended.
        sig { returns(T.nilable(Float)) }
        attr_accessor :cost

        # Billable talk time in seconds, measured from answer to hangup.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :duration_seconds

        # When the call ended.
        sig { returns(T.nilable(Time)) }
        attr_accessor :ended_at

        # Why the call ended (e.g. `agent_ended`, `max_duration`, `transfer`, `hangup`).
        # Present once the call is no longer active.
        sig { returns(T.nilable(String)) }
        attr_accessor :end_reason

        # Arbitrary metadata you attached when creating the call.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # Ordered transcript of the call. Included when retrieving a single call; omitted
        # from list responses.
        sig do
          returns(
            T.nilable(
              T::Array[Zavudev::Models::CallHangupResponse::Call::Transcript]
            )
          )
        end
        attr_reader :transcript

        sig do
          params(
            transcript:
              T::Array[
                Zavudev::Models::CallHangupResponse::Call::Transcript::OrHash
              ]
          ).void
        end
        attr_writer :transcript

        # Number of conversation turns exchanged during the call.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :turn_count

        sig { returns(T.nilable(Time)) }
        attr_reader :updated_at

        sig { params(updated_at: Time).void }
        attr_writer :updated_at

        sig do
          params(
            id: String,
            created_at: Time,
            direction:
              Zavudev::Models::CallHangupResponse::Call::Direction::OrSymbol,
            from: String,
            status: Zavudev::Models::CallHangupResponse::Call::Status::OrSymbol,
            to: String,
            answered_at: T.nilable(Time),
            cost: T.nilable(Float),
            duration_seconds: T.nilable(Integer),
            ended_at: T.nilable(Time),
            end_reason: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            transcript:
              T::Array[
                Zavudev::Models::CallHangupResponse::Call::Transcript::OrHash
              ],
            turn_count: T.nilable(Integer),
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          # Whether the call was placed by Zavu (outbound) or received from a caller
          # (inbound).
          direction:,
          # Caller phone number in E.164 format. Your sender's number for outbound calls;
          # the caller's number for inbound calls.
          from:,
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
          status:,
          # Callee phone number in E.164 format.
          to:,
          # When the call was answered.
          answered_at: nil,
          # Total cost of the call in USD, combining the managed voice pipeline per-minute
          # charge and telephony. Available once the call has ended.
          cost: nil,
          # Billable talk time in seconds, measured from answer to hangup.
          duration_seconds: nil,
          # When the call ended.
          ended_at: nil,
          # Why the call ended (e.g. `agent_ended`, `max_duration`, `transfer`, `hangup`).
          # Present once the call is no longer active.
          end_reason: nil,
          # Arbitrary metadata you attached when creating the call.
          metadata: nil,
          # Ordered transcript of the call. Included when retrieving a single call; omitted
          # from list responses.
          transcript: nil,
          # Number of conversation turns exchanged during the call.
          turn_count: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              direction:
                Zavudev::Models::CallHangupResponse::Call::Direction::TaggedSymbol,
              from: String,
              status:
                Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol,
              to: String,
              answered_at: T.nilable(Time),
              cost: T.nilable(Float),
              duration_seconds: T.nilable(Integer),
              ended_at: T.nilable(Time),
              end_reason: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              transcript:
                T::Array[Zavudev::Models::CallHangupResponse::Call::Transcript],
              turn_count: T.nilable(Integer),
              updated_at: Time
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
            T.type_alias do
              T.all(
                Symbol,
                Zavudev::Models::CallHangupResponse::Call::Direction
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INBOUND =
            T.let(
              :inbound,
              Zavudev::Models::CallHangupResponse::Call::Direction::TaggedSymbol
            )
          OUTBOUND =
            T.let(
              :outbound,
              Zavudev::Models::CallHangupResponse::Call::Direction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::CallHangupResponse::Call::Direction::TaggedSymbol
              ]
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
            T.type_alias do
              T.all(Symbol, Zavudev::Models::CallHangupResponse::Call::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          QUEUED =
            T.let(
              :queued,
              Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
            )
          RINGING =
            T.let(
              :ringing,
              Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
            )
          IN_PROGRESS =
            T.let(
              :in_progress,
              Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
            )
          BUSY =
            T.let(
              :busy,
              Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
            )
          NO_ANSWER =
            T.let(
              :no_answer,
              Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
            )
          CANCELED =
            T.let(
              :canceled,
              Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::CallHangupResponse::Call::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Transcript < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::CallHangupResponse::Call::Transcript,
                Zavudev::Internal::AnyHash
              )
            end

          # Who produced the turn. `tool` records a tool call the agent made during the
          # conversation.
          sig do
            returns(
              Zavudev::Models::CallHangupResponse::Call::Transcript::Role::TaggedSymbol
            )
          end
          attr_accessor :role

          # Ordinal position of the turn within the call, starting at 0.
          sig { returns(Integer) }
          attr_accessor :seq

          # Transcribed speech for `user` and `assistant` turns, or a JSON summary of the
          # tool call for `tool` turns.
          sig { returns(String) }
          attr_accessor :text

          # When the turn ended.
          sig { returns(T.nilable(Time)) }
          attr_accessor :ended_at

          # When the turn started.
          sig { returns(T.nilable(Time)) }
          attr_accessor :started_at

          # A single turn in a voice call transcript.
          sig do
            params(
              role:
                Zavudev::Models::CallHangupResponse::Call::Transcript::Role::OrSymbol,
              seq: Integer,
              text: String,
              ended_at: T.nilable(Time),
              started_at: T.nilable(Time)
            ).returns(T.attached_class)
          end
          def self.new(
            # Who produced the turn. `tool` records a tool call the agent made during the
            # conversation.
            role:,
            # Ordinal position of the turn within the call, starting at 0.
            seq:,
            # Transcribed speech for `user` and `assistant` turns, or a JSON summary of the
            # tool call for `tool` turns.
            text:,
            # When the turn ended.
            ended_at: nil,
            # When the turn started.
            started_at: nil
          )
          end

          sig do
            override.returns(
              {
                role:
                  Zavudev::Models::CallHangupResponse::Call::Transcript::Role::TaggedSymbol,
                seq: Integer,
                text: String,
                ended_at: T.nilable(Time),
                started_at: T.nilable(Time)
              }
            )
          end
          def to_hash
          end

          # Who produced the turn. `tool` records a tool call the agent made during the
          # conversation.
          module Role
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Zavudev::Models::CallHangupResponse::Call::Transcript::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER =
              T.let(
                :user,
                Zavudev::Models::CallHangupResponse::Call::Transcript::Role::TaggedSymbol
              )
            ASSISTANT =
              T.let(
                :assistant,
                Zavudev::Models::CallHangupResponse::Call::Transcript::Role::TaggedSymbol
              )
            TOOL =
              T.let(
                :tool,
                Zavudev::Models::CallHangupResponse::Call::Transcript::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Models::CallHangupResponse::Call::Transcript::Role::TaggedSymbol
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
