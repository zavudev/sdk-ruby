# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolTestResponse < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Senders::Agent::ToolTestResponse,
                Zavudev::Internal::AnyHash
              )
            end

          # One run of a tool triggered from the test endpoint. Recorded so a test is
          # verifiable after the fact rather than only visible in the response.
          sig do
            returns(Zavudev::Models::Senders::Agent::ToolTestResponse::Run)
          end
          attr_reader :run

          sig do
            params(
              run:
                Zavudev::Models::Senders::Agent::ToolTestResponse::Run::OrHash
            ).void
          end
          attr_writer :run

          sig do
            params(
              run:
                Zavudev::Models::Senders::Agent::ToolTestResponse::Run::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # One run of a tool triggered from the test endpoint. Recorded so a test is
            # verifiable after the fact rather than only visible in the response.
            run:
          )
          end

          sig do
            override.returns(
              { run: Zavudev::Models::Senders::Agent::ToolTestResponse::Run }
            )
          end
          def to_hash
          end

          class Run < Zavudev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Models::Senders::Agent::ToolTestResponse::Run,
                  Zavudev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :id

            sig { returns(Time) }
            attr_accessor :created_at

            sig { returns(Integer) }
            attr_accessor :duration_ms

            # Whether the tool returned without error. A tool that answered with a non-2xx
            # status is a failed run, not an error of this endpoint.
            sig { returns(T::Boolean) }
            attr_accessor :success

            sig { returns(String) }
            attr_accessor :tool_id

            # Why the run failed, when it did.
            sig { returns(T.nilable(String)) }
            attr_accessor :error

            # The parameters the tool was called with.
            sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
            attr_reader :params

            sig { params(params: T::Hash[Symbol, T.anything]).void }
            attr_writer :params

            # The tool's response body, truncated.
            sig { returns(T.nilable(String)) }
            attr_accessor :response

            # HTTP status the tool's webhook returned. Absent for tools that do not go over
            # HTTP.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :status_code

            # One run of a tool triggered from the test endpoint. Recorded so a test is
            # verifiable after the fact rather than only visible in the response.
            sig do
              params(
                id: String,
                created_at: Time,
                duration_ms: Integer,
                success: T::Boolean,
                tool_id: String,
                error: T.nilable(String),
                params: T::Hash[Symbol, T.anything],
                response: T.nilable(String),
                status_code: T.nilable(Integer)
              ).returns(T.attached_class)
            end
            def self.new(
              id:,
              created_at:,
              duration_ms:,
              # Whether the tool returned without error. A tool that answered with a non-2xx
              # status is a failed run, not an error of this endpoint.
              success:,
              tool_id:,
              # Why the run failed, when it did.
              error: nil,
              # The parameters the tool was called with.
              params: nil,
              # The tool's response body, truncated.
              response: nil,
              # HTTP status the tool's webhook returned. Absent for tools that do not go over
              # HTTP.
              status_code: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  created_at: Time,
                  duration_ms: Integer,
                  success: T::Boolean,
                  tool_id: String,
                  error: T.nilable(String),
                  params: T::Hash[Symbol, T.anything],
                  response: T.nilable(String),
                  status_code: T.nilable(Integer)
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
end
