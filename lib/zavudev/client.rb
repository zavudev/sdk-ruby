# frozen_string_literal: true

module Zavudev
  class Client < Zavudev::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String]
    attr_reader :api_key

    # @return [Zavudev::Resources::Messages]
    attr_reader :messages

    # @return [Zavudev::Resources::Templates]
    attr_reader :templates

    # @return [Zavudev::Resources::Senders]
    attr_reader :senders

    # @return [Zavudev::Resources::Contacts]
    attr_reader :contacts

    # @return [Zavudev::Resources::Broadcasts]
    attr_reader :broadcasts

    # @return [Zavudev::Resources::Introspect]
    attr_reader :introspect

    # @return [Zavudev::Resources::PhoneNumbers]
    attr_reader :phone_numbers

    # @return [Zavudev::Resources::Addresses]
    attr_reader :addresses

    # @return [Zavudev::Resources::RegulatoryDocuments]
    attr_reader :regulatory_documents

    # @return [Zavudev::Resources::Invitations]
    attr_reader :invitations

    # @return [Zavudev::Resources::Exports]
    attr_reader :exports

    # @return [Zavudev::Resources::URLs]
    attr_reader :urls

    # @return [Zavudev::Resources::Balance]
    attr_reader :balance

    # @return [Zavudev::Resources::Plan]
    attr_reader :plan

    # @return [Zavudev::Resources::Usage]
    attr_reader :usage

    # @return [Zavudev::Resources::SubAccounts]
    attr_reader :sub_accounts

    # @return [Zavudev::Resources::Number10dlc]
    attr_reader :number_10dlc

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["ZAVUDEV_API_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["ZAVUDEV_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["ZAVUDEV_API_KEY"],
      base_url: ENV["ZAVUDEV_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.zavu.dev"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"ZAVUDEV_API_KEY\"")
      end

      headers = {}
      custom_headers_env = ENV["ZAVUDEV_CUSTOM_HEADERS"]
      unless custom_headers_env.nil?
        parsed = {}
        custom_headers_env.split("\n").each do |line|
          colon = line.index(":")
          unless colon.nil?
            parsed[line[0...colon].strip] = line[(colon + 1)..].strip
          end
        end
        headers = parsed.merge(headers)
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers
      )

      @messages = Zavudev::Resources::Messages.new(client: self)
      @templates = Zavudev::Resources::Templates.new(client: self)
      @senders = Zavudev::Resources::Senders.new(client: self)
      @contacts = Zavudev::Resources::Contacts.new(client: self)
      @broadcasts = Zavudev::Resources::Broadcasts.new(client: self)
      @introspect = Zavudev::Resources::Introspect.new(client: self)
      @phone_numbers = Zavudev::Resources::PhoneNumbers.new(client: self)
      @addresses = Zavudev::Resources::Addresses.new(client: self)
      @regulatory_documents = Zavudev::Resources::RegulatoryDocuments.new(client: self)
      @invitations = Zavudev::Resources::Invitations.new(client: self)
      @exports = Zavudev::Resources::Exports.new(client: self)
      @urls = Zavudev::Resources::URLs.new(client: self)
      @balance = Zavudev::Resources::Balance.new(client: self)
      @plan = Zavudev::Resources::Plan.new(client: self)
      @usage = Zavudev::Resources::Usage.new(client: self)
      @sub_accounts = Zavudev::Resources::SubAccounts.new(client: self)
      @number_10dlc = Zavudev::Resources::Number10dlc.new(client: self)
    end
  end
end
