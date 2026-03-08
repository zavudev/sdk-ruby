# typed: strong

module Zavudev
  module Models
    class BroadcastContact < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::BroadcastContact, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :recipient

      sig { returns(Zavudev::BroadcastContact::RecipientType::TaggedSymbol) }
      attr_accessor :recipient_type

      # Status of a contact within a broadcast.
      sig { returns(Zavudev::BroadcastContactStatus::TaggedSymbol) }
      attr_accessor :status

      sig { returns(T.nilable(Float)) }
      attr_accessor :cost

      sig { returns(T.nilable(String)) }
      attr_reader :error_code

      sig { params(error_code: String).void }
      attr_writer :error_code

      sig { returns(T.nilable(String)) }
      attr_reader :error_message

      sig { params(error_message: String).void }
      attr_writer :error_message

      # Associated message ID after processing.
      sig { returns(T.nilable(String)) }
      attr_reader :message_id

      sig { params(message_id: String).void }
      attr_writer :message_id

      sig { returns(T.nilable(Time)) }
      attr_reader :processed_at

      sig { params(processed_at: Time).void }
      attr_writer :processed_at

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :template_variables

      sig { params(template_variables: T::Hash[Symbol, String]).void }
      attr_writer :template_variables

      sig do
        params(
          id: String,
          created_at: Time,
          recipient: String,
          recipient_type: Zavudev::BroadcastContact::RecipientType::OrSymbol,
          status: Zavudev::BroadcastContactStatus::OrSymbol,
          cost: T.nilable(Float),
          error_code: String,
          error_message: String,
          message_id: String,
          processed_at: Time,
          template_variables: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        recipient:,
        recipient_type:,
        # Status of a contact within a broadcast.
        status:,
        cost: nil,
        error_code: nil,
        error_message: nil,
        # Associated message ID after processing.
        message_id: nil,
        processed_at: nil,
        template_variables: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            recipient: String,
            recipient_type:
              Zavudev::BroadcastContact::RecipientType::TaggedSymbol,
            status: Zavudev::BroadcastContactStatus::TaggedSymbol,
            cost: T.nilable(Float),
            error_code: String,
            error_message: String,
            message_id: String,
            processed_at: Time,
            template_variables: T::Hash[Symbol, String]
          }
        )
      end
      def to_hash
      end

      module RecipientType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::BroadcastContact::RecipientType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PHONE =
          T.let(:phone, Zavudev::BroadcastContact::RecipientType::TaggedSymbol)
        EMAIL =
          T.let(:email, Zavudev::BroadcastContact::RecipientType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::BroadcastContact::RecipientType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
