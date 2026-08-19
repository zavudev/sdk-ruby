# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Calls#retrieve
    class CallRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute call
      #
      #   @return [Zavudev::Models::CallRetrieveResponse::Call]
      required :call, -> { Zavudev::Models::CallRetrieveResponse::Call }

      # @!method initialize(call:)
      #   @param call [Zavudev::Models::CallRetrieveResponse::Call]

      # @see Zavudev::Models::CallRetrieveResponse#call
      class Call < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute direction
        #   Whether the call was placed by Zavu (outbound) or received from a caller
        #   (inbound).
        #
        #   @return [Symbol, Zavudev::Models::CallRetrieveResponse::Call::Direction]
        required :direction, enum: -> { Zavudev::Models::CallRetrieveResponse::Call::Direction }

        # @!attribute from
        #   Caller phone number in E.164 format. Your sender's number for outbound calls;
        #   the caller's number for inbound calls.
        #
        #   @return [String]
        required :from, String

        # @!attribute status
        #   Lifecycle status of a voice call.
        #
        #   - `queued`: outbound call created, not yet dialing.
        #   - `ringing`: dialing (outbound) or received and ringing (inbound).
        #   - `in_progress`: answered, the agent is connected.
        #   - `completed`: ended after a conversation.
        #   - `failed`: could not be completed.
        #   - `busy`: the line was busy.
        #   - `no_answer`: rang but was not answered.
        #   - `canceled`: canceled before it was answered.
        #
        #   @return [Symbol, Zavudev::Models::CallRetrieveResponse::Call::Status]
        required :status, enum: -> { Zavudev::Models::CallRetrieveResponse::Call::Status }

        # @!attribute to
        #   Callee phone number in E.164 format.
        #
        #   @return [String]
        required :to, String

        # @!attribute answered_at
        #   When the call was answered.
        #
        #   @return [Time, nil]
        optional :answered_at, Time, api_name: :answeredAt, nil?: true

        # @!attribute cost
        #   Total cost of the call in USD, combining the managed voice pipeline per-minute
        #   charge and telephony. Available once the call has ended.
        #
        #   @return [Float, nil]
        optional :cost, Float, nil?: true

        # @!attribute duration_seconds
        #   Billable talk time in seconds, measured from answer to hangup.
        #
        #   @return [Integer, nil]
        optional :duration_seconds, Integer, api_name: :durationSeconds, nil?: true

        # @!attribute ended_at
        #   When the call ended.
        #
        #   @return [Time, nil]
        optional :ended_at, Time, api_name: :endedAt, nil?: true

        # @!attribute end_reason
        #   Why the call ended (e.g. `agent_ended`, `max_duration`, `transfer`, `hangup`).
        #   Present once the call is no longer active.
        #
        #   @return [String, nil]
        optional :end_reason, String, api_name: :endReason, nil?: true

        # @!attribute metadata
        #   Arbitrary metadata you attached when creating the call.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Zavudev::Internal::Type::HashOf[String]

        # @!attribute transcript
        #   Ordered transcript of the call. Included when retrieving a single call; omitted
        #   from list responses.
        #
        #   @return [Array<Zavudev::Models::CallRetrieveResponse::Call::Transcript>, nil]
        optional :transcript,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::CallRetrieveResponse::Call::Transcript] }

        # @!attribute turn_count
        #   Number of conversation turns exchanged during the call.
        #
        #   @return [Integer, nil]
        optional :turn_count, Integer, api_name: :turnCount, nil?: true

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, created_at:, direction:, from:, status:, to:, answered_at: nil, cost: nil, duration_seconds: nil, ended_at: nil, end_reason: nil, metadata: nil, transcript: nil, turn_count: nil, updated_at: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::CallRetrieveResponse::Call} for more details.
        #
        #   @param id [String]
        #
        #   @param created_at [Time]
        #
        #   @param direction [Symbol, Zavudev::Models::CallRetrieveResponse::Call::Direction] Whether the call was placed by Zavu (outbound) or received from a caller (inboun
        #
        #   @param from [String] Caller phone number in E.164 format. Your sender's number for outbound calls; th
        #
        #   @param status [Symbol, Zavudev::Models::CallRetrieveResponse::Call::Status] Lifecycle status of a voice call.
        #
        #   @param to [String] Callee phone number in E.164 format.
        #
        #   @param answered_at [Time, nil] When the call was answered.
        #
        #   @param cost [Float, nil] Total cost of the call in USD, combining the managed voice pipeline per-minute c
        #
        #   @param duration_seconds [Integer, nil] Billable talk time in seconds, measured from answer to hangup.
        #
        #   @param ended_at [Time, nil] When the call ended.
        #
        #   @param end_reason [String, nil] Why the call ended (e.g. `agent_ended`, `max_duration`, `transfer`, `hangup`). P
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary metadata you attached when creating the call.
        #
        #   @param transcript [Array<Zavudev::Models::CallRetrieveResponse::Call::Transcript>] Ordered transcript of the call. Included when retrieving a single call; omitted
        #
        #   @param turn_count [Integer, nil] Number of conversation turns exchanged during the call.
        #
        #   @param updated_at [Time]

        # Whether the call was placed by Zavu (outbound) or received from a caller
        # (inbound).
        #
        # @see Zavudev::Models::CallRetrieveResponse::Call#direction
        module Direction
          extend Zavudev::Internal::Type::Enum

          INBOUND = :inbound
          OUTBOUND = :outbound

          # @!method self.values
          #   @return [Array<Symbol>]
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
        #
        # @see Zavudev::Models::CallRetrieveResponse::Call#status
        module Status
          extend Zavudev::Internal::Type::Enum

          QUEUED = :queued
          RINGING = :ringing
          IN_PROGRESS = :in_progress
          COMPLETED = :completed
          FAILED = :failed
          BUSY = :busy
          NO_ANSWER = :no_answer
          CANCELED = :canceled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Transcript < Zavudev::Internal::Type::BaseModel
          # @!attribute role
          #   Who produced the turn. `tool` records a tool call the agent made during the
          #   conversation.
          #
          #   @return [Symbol, Zavudev::Models::CallRetrieveResponse::Call::Transcript::Role]
          required :role, enum: -> { Zavudev::Models::CallRetrieveResponse::Call::Transcript::Role }

          # @!attribute seq
          #   Ordinal position of the turn within the call, starting at 0.
          #
          #   @return [Integer]
          required :seq, Integer

          # @!attribute text
          #   Transcribed speech for `user` and `assistant` turns, or a JSON summary of the
          #   tool call for `tool` turns.
          #
          #   @return [String]
          required :text, String

          # @!attribute ended_at
          #   When the turn ended.
          #
          #   @return [Time, nil]
          optional :ended_at, Time, api_name: :endedAt, nil?: true

          # @!attribute started_at
          #   When the turn started.
          #
          #   @return [Time, nil]
          optional :started_at, Time, api_name: :startedAt, nil?: true

          # @!method initialize(role:, seq:, text:, ended_at: nil, started_at: nil)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::CallRetrieveResponse::Call::Transcript} for more details.
          #
          #   A single turn in a voice call transcript.
          #
          #   @param role [Symbol, Zavudev::Models::CallRetrieveResponse::Call::Transcript::Role] Who produced the turn. `tool` records a tool call the agent made during the conv
          #
          #   @param seq [Integer] Ordinal position of the turn within the call, starting at 0.
          #
          #   @param text [String] Transcribed speech for `user` and `assistant` turns, or a JSON summary of the to
          #
          #   @param ended_at [Time, nil] When the turn ended.
          #
          #   @param started_at [Time, nil] When the turn started.

          # Who produced the turn. `tool` records a tool call the agent made during the
          # conversation.
          #
          # @see Zavudev::Models::CallRetrieveResponse::Call::Transcript#role
          module Role
            extend Zavudev::Internal::Type::Enum

            USER = :user
            ASSISTANT = :assistant
            TOOL = :tool

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
