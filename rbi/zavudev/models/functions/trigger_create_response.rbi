# typed: strong

module Zavudev
  module Models
    module Functions
      class TriggerCreateResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Functions::TriggerCreateResponse,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :added

        # Number of triggers that already existed.
        sig { returns(Integer) }
        attr_accessor :skipped

        sig do
          returns(
            T::Array[Zavudev::Models::Functions::TriggerCreateResponse::Trigger]
          )
        end
        attr_accessor :triggers

        sig do
          params(
            added: Integer,
            skipped: Integer,
            triggers:
              T::Array[
                Zavudev::Models::Functions::TriggerCreateResponse::Trigger::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          added:,
          # Number of triggers that already existed.
          skipped:,
          triggers:
        )
        end

        sig do
          override.returns(
            {
              added: Integer,
              skipped: Integer,
              triggers:
                T::Array[
                  Zavudev::Models::Functions::TriggerCreateResponse::Trigger
                ]
            }
          )
        end
        def to_hash
        end

        class Trigger < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Functions::TriggerCreateResponse::Trigger,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(T::Boolean) }
          attr_accessor :active

          sig { returns(Time) }
          attr_accessor :created_at

          # Event type that fires the function. See GET /v1/functions/event-types for the
          # supported list. The special type `cron` fires on a schedule instead of a
          # messaging event and carries a `cron` expression.
          sig { returns(String) }
          attr_accessor :event_type

          sig { returns(String) }
          attr_accessor :function_id

          sig { returns(Time) }
          attr_accessor :updated_at

          # 5-field cron expression (minute hour day-of-month month day-of-week), evaluated
          # in UTC. Present only on `cron` triggers.
          sig { returns(T.nilable(String)) }
          attr_accessor :cron

          # Last time the schedule fired. Null until the first fire.
          sig { returns(T.nilable(Time)) }
          attr_accessor :last_run_at

          # Next scheduled fire time. Present only on `cron` triggers.
          sig { returns(T.nilable(Time)) }
          attr_accessor :next_run_at

          # Restrict the trigger to a single sender. Null means all senders in the project.
          sig { returns(T.nilable(String)) }
          attr_accessor :sender_id

          # A subscription that runs a Zavu Function when a messaging event fires.
          sig do
            params(
              id: String,
              active: T::Boolean,
              created_at: Time,
              event_type: String,
              function_id: String,
              updated_at: Time,
              cron: T.nilable(String),
              last_run_at: T.nilable(Time),
              next_run_at: T.nilable(Time),
              sender_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            active:,
            created_at:,
            # Event type that fires the function. See GET /v1/functions/event-types for the
            # supported list. The special type `cron` fires on a schedule instead of a
            # messaging event and carries a `cron` expression.
            event_type:,
            function_id:,
            updated_at:,
            # 5-field cron expression (minute hour day-of-month month day-of-week), evaluated
            # in UTC. Present only on `cron` triggers.
            cron: nil,
            # Last time the schedule fired. Null until the first fire.
            last_run_at: nil,
            # Next scheduled fire time. Present only on `cron` triggers.
            next_run_at: nil,
            # Restrict the trigger to a single sender. Null means all senders in the project.
            sender_id: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                active: T::Boolean,
                created_at: Time,
                event_type: String,
                function_id: String,
                updated_at: Time,
                cron: T.nilable(String),
                last_run_at: T.nilable(Time),
                next_run_at: T.nilable(Time),
                sender_id: T.nilable(String)
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
