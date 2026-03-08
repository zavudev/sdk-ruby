# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class KnowledgeBaseUpdateParams < Zavudev::Internal::Type::BaseModel
          extend Zavudev::Internal::Type::RequestParameters::Converter
          include Zavudev::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::KnowledgeBaseUpdateParams,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :sender_id

          sig { returns(String) }
          attr_accessor :kb_id

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            params(
              sender_id: String,
              kb_id: String,
              description: T.nilable(String),
              name: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            sender_id:,
            kb_id:,
            description: nil,
            name: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                sender_id: String,
                kb_id: String,
                description: T.nilable(String),
                name: String,
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
