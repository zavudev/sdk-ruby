# typed: strong

module Zavudev
  module Models
    class SubAccount < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::SubAccount, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Zavudev::SubAccount::Status::TaggedSymbol) }
      attr_accessor :status

      # Total amount spent by this sub-account in cents.
      sig { returns(Integer) }
      attr_accessor :total_spent

      # API key for the sub-account. Only returned on creation.
      sig { returns(T.nilable(String)) }
      attr_reader :api_key

      sig { params(api_key: String).void }
      attr_writer :api_key

      # Spending cap in cents. When reached, messages from this sub-account will be
      # blocked.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :credit_limit

      # External reference ID set by the parent account.
      sig { returns(T.nilable(String)) }
      attr_accessor :external_id

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :metadata

      sig do
        params(
          id: String,
          created_at: Time,
          name: String,
          status: Zavudev::SubAccount::Status::OrSymbol,
          total_spent: Integer,
          api_key: String,
          credit_limit: T.nilable(Integer),
          external_id: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.anything])
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        created_at:,
        name:,
        status:,
        # Total amount spent by this sub-account in cents.
        total_spent:,
        # API key for the sub-account. Only returned on creation.
        api_key: nil,
        # Spending cap in cents. When reached, messages from this sub-account will be
        # blocked.
        credit_limit: nil,
        # External reference ID set by the parent account.
        external_id: nil,
        metadata: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            name: String,
            status: Zavudev::SubAccount::Status::TaggedSymbol,
            total_spent: Integer,
            api_key: String,
            credit_limit: T.nilable(Integer),
            external_id: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.anything])
          }
        )
      end
      def to_hash
      end

      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::SubAccount::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE = T.let(:active, Zavudev::SubAccount::Status::TaggedSymbol)
        INACTIVE = T.let(:inactive, Zavudev::SubAccount::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Zavudev::SubAccount::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
