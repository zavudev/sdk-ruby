# typed: strong

module Zavudev
  class Client < Zavudev::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(String) }
    attr_reader :api_key

    sig { returns(Zavudev::Resources::Messages) }
    attr_reader :messages

    sig { returns(Zavudev::Resources::Templates) }
    attr_reader :templates

    sig { returns(Zavudev::Resources::Senders) }
    attr_reader :senders

    sig { returns(Zavudev::Resources::Contacts) }
    attr_reader :contacts

    sig { returns(Zavudev::Resources::Broadcasts) }
    attr_reader :broadcasts

    sig { returns(Zavudev::Resources::Introspect) }
    attr_reader :introspect

    sig { returns(Zavudev::Resources::PhoneNumbers) }
    attr_reader :phone_numbers

    sig { returns(Zavudev::Resources::Addresses) }
    attr_reader :addresses

    sig { returns(Zavudev::Resources::RegulatoryDocuments) }
    attr_reader :regulatory_documents

    sig { returns(Zavudev::Resources::Invitations) }
    attr_reader :invitations

    sig { returns(Zavudev::Resources::Exports) }
    attr_reader :exports

    sig { returns(Zavudev::Resources::URLs) }
    attr_reader :urls

    sig { returns(Zavudev::Resources::Balance) }
    attr_reader :balance

    sig { returns(Zavudev::Resources::Plan) }
    attr_reader :plan

    sig { returns(Zavudev::Resources::Usage) }
    attr_reader :usage

    sig { returns(Zavudev::Resources::SubAccounts) }
    attr_reader :sub_accounts

    sig { returns(Zavudev::Resources::Number10dlc) }
    attr_reader :number_10dlc

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["ZAVUDEV_API_KEY"]`
      api_key: ENV["ZAVUDEV_API_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["ZAVUDEV_BASE_URL"]`
      base_url: ENV["ZAVUDEV_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Zavudev::Client::DEFAULT_MAX_RETRIES,
      timeout: Zavudev::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Zavudev::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Zavudev::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
