# typed: strong

module Zavudev
  module Models
    module Senders
      AgentDocument = Agent::AgentDocument

      module Agent
        class AgentDocument < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::AgentDocument,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # Number of chunks created from this document.
          sig { returns(Integer) }
          attr_accessor :chunk_count

          # Length of the document content in characters.
          sig { returns(Integer) }
          attr_accessor :content_length

          sig { returns(Time) }
          attr_accessor :created_at

          # Whether the document has been processed for RAG.
          sig { returns(T::Boolean) }
          attr_accessor :is_processed

          sig { returns(String) }
          attr_accessor :knowledge_base_id

          sig { returns(String) }
          attr_accessor :title

          sig { returns(Time) }
          attr_accessor :updated_at

          sig do
            params(
              id: String,
              chunk_count: Integer,
              content_length: Integer,
              created_at: Time,
              is_processed: T::Boolean,
              knowledge_base_id: String,
              title: String,
              updated_at: Time
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # Number of chunks created from this document.
            chunk_count:,
            # Length of the document content in characters.
            content_length:,
            created_at:,
            # Whether the document has been processed for RAG.
            is_processed:,
            knowledge_base_id:,
            title:,
            updated_at:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                chunk_count: Integer,
                content_length: Integer,
                created_at: Time,
                is_processed: T::Boolean,
                knowledge_base_id: String,
                title: String,
                updated_at: Time
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
