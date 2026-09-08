# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::Triggers#create
      class TriggerCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute function_id
        #
        #   @return [String]
        required :function_id, String

        # @!attribute event_types
        #   Event types to subscribe to.
        #
        #   @return [Array<String>]
        required :event_types, Zavudev::Internal::Type::ArrayOf[String], api_name: :eventTypes

        # @!attribute sender_ids
        #   Senders to scope the triggers to. Use null for all senders.
        #
        #   @return [Array<String, nil>]
        required :sender_ids, Zavudev::Internal::Type::ArrayOf[String, nil?: true], api_name: :senderIds

        # @!attribute cron
        #   Required when eventTypes includes `cron`: a 5-field cron expression (minute hour
        #   day-of-month month day-of-week), evaluated in UTC.
        #
        #   @return [String, nil]
        optional :cron, String

        # @!method initialize(function_id:, event_types:, sender_ids:, cron: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::Functions::TriggerCreateParams} for more details.
        #
        #   @param function_id [String]
        #
        #   @param event_types [Array<String>] Event types to subscribe to.
        #
        #   @param sender_ids [Array<String, nil>] Senders to scope the triggers to. Use null for all senders.
        #
        #   @param cron [String] Required when eventTypes includes `cron`: a 5-field cron expression (minute hour
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
