# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolListTestRunsResponse < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Senders::Agent::ToolListTestRunsResponse,
                Zavudev::Internal::AnyHash
              )
            end

          sig do
            returns(
              T::Array[
                Zavudev::Models::Senders::Agent::ToolListTestRunsResponse::Item
              ]
            )
          end
          attr_accessor :items

          sig do
            params(
              items:
                T::Array[
                  Zavudev::Models::Senders::Agent::ToolListTestRunsResponse::Item::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(items:)
          end

          sig do
            override.returns(
              {
                items:
                  T::Array[
                    Zavudev::Models::Senders::Agent::ToolListTestRunsResponse::Item
                  ]
              }
            )
          end
          def to_hash
          end

          class Item < Zavudev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Models::Senders::Agent::ToolListTestRunsResponse::Item,
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
