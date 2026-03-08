# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolListParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::ToolListParams,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(T.nilable(String)) }
          attr_reader :cursor

          sig { params(cursor: String).void }
          attr_writer :cursor

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :enabled

          sig { params(enabled: T::Boolean).void }
          attr_writer :enabled

          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          sig do
            params(
              sender_id: String,
              cursor: String,
              enabled: T::Boolean,
              limit: Integer,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            sender_id:,
            cursor: nil,
            enabled: nil,
            limit: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                sender_id: String,
                cursor: String,
                enabled: T::Boolean,
                limit: Integer,
                request_options: Zavudev::RequestOptions
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
