# frozen_string_literal: true

module Zavudev
  [Zavudev::Internal::Type::BaseModel, *Zavudev::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Zavudev::Internal::AnyHash) } }
  end

  Zavudev::Internal::Util.walk_namespaces(Zavudev::Models).each do |mod|
    case mod
    in Zavudev::Internal::Type::Enum | Zavudev::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Zavudev::Internal::Util.walk_namespaces(Zavudev::Models)
                         .lazy
                         .grep(Zavudev::Internal::Type::Union)
                         .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Address = Zavudev::Models::Address

  AddressCreateParams = Zavudev::Models::AddressCreateParams

  AddressDeleteParams = Zavudev::Models::AddressDeleteParams

  AddressListParams = Zavudev::Models::AddressListParams

  AddressRetrieveParams = Zavudev::Models::AddressRetrieveParams

  AddressStatus = Zavudev::Models::AddressStatus

  AvailablePhoneNumber = Zavudev::Models::AvailablePhoneNumber

  Broadcast = Zavudev::Models::Broadcast

  BroadcastCancelParams = Zavudev::Models::BroadcastCancelParams

  BroadcastChannel = Zavudev::Models::BroadcastChannel

  BroadcastContact = Zavudev::Models::BroadcastContact

  BroadcastContactStatus = Zavudev::Models::BroadcastContactStatus

  BroadcastContent = Zavudev::Models::BroadcastContent

  BroadcastCreateParams = Zavudev::Models::BroadcastCreateParams

  BroadcastDeleteParams = Zavudev::Models::BroadcastDeleteParams

  BroadcastListParams = Zavudev::Models::BroadcastListParams

  BroadcastMessageType = Zavudev::Models::BroadcastMessageType

  BroadcastProgress = Zavudev::Models::BroadcastProgress

  BroadcastProgressParams = Zavudev::Models::BroadcastProgressParams

  BroadcastRescheduleParams = Zavudev::Models::BroadcastRescheduleParams

  BroadcastRetrieveParams = Zavudev::Models::BroadcastRetrieveParams

  Broadcasts = Zavudev::Models::Broadcasts

  BroadcastSendParams = Zavudev::Models::BroadcastSendParams

  BroadcastStatus = Zavudev::Models::BroadcastStatus

  BroadcastUpdateParams = Zavudev::Models::BroadcastUpdateParams

  Channel = Zavudev::Models::Channel

  Contact = Zavudev::Models::Contact

  ContactChannel = Zavudev::Models::ContactChannel

  ContactListParams = Zavudev::Models::ContactListParams

  ContactRetrieveByPhoneParams = Zavudev::Models::ContactRetrieveByPhoneParams

  ContactRetrieveParams = Zavudev::Models::ContactRetrieveParams

  ContactUpdateParams = Zavudev::Models::ContactUpdateParams

  IntrospectValidatePhoneParams = Zavudev::Models::IntrospectValidatePhoneParams

  LineType = Zavudev::Models::LineType

  Message = Zavudev::Models::Message

  MessageContent = Zavudev::Models::MessageContent

  MessageListParams = Zavudev::Models::MessageListParams

  MessageReactParams = Zavudev::Models::MessageReactParams

  MessageResponse = Zavudev::Models::MessageResponse

  MessageRetrieveParams = Zavudev::Models::MessageRetrieveParams

  MessageSendParams = Zavudev::Models::MessageSendParams

  MessageStatus = Zavudev::Models::MessageStatus

  MessageType = Zavudev::Models::MessageType

  OwnedPhoneNumber = Zavudev::Models::OwnedPhoneNumber

  OwnedPhoneNumberPricing = Zavudev::Models::OwnedPhoneNumberPricing

  PhoneNumberCapabilities = Zavudev::Models::PhoneNumberCapabilities

  PhoneNumberListParams = Zavudev::Models::PhoneNumberListParams

  PhoneNumberPricing = Zavudev::Models::PhoneNumberPricing

  PhoneNumberPurchaseParams = Zavudev::Models::PhoneNumberPurchaseParams

  PhoneNumberReleaseParams = Zavudev::Models::PhoneNumberReleaseParams

  PhoneNumberRequirementsParams = Zavudev::Models::PhoneNumberRequirementsParams

  PhoneNumberRetrieveParams = Zavudev::Models::PhoneNumberRetrieveParams

  PhoneNumberSearchAvailableParams = Zavudev::Models::PhoneNumberSearchAvailableParams

  PhoneNumberStatus = Zavudev::Models::PhoneNumberStatus

  PhoneNumberType = Zavudev::Models::PhoneNumberType

  PhoneNumberUpdateParams = Zavudev::Models::PhoneNumberUpdateParams

  RegulatoryDocument = Zavudev::Models::RegulatoryDocument

  RegulatoryDocumentCreateParams = Zavudev::Models::RegulatoryDocumentCreateParams

  RegulatoryDocumentDeleteParams = Zavudev::Models::RegulatoryDocumentDeleteParams

  RegulatoryDocumentListParams = Zavudev::Models::RegulatoryDocumentListParams

  RegulatoryDocumentRetrieveParams = Zavudev::Models::RegulatoryDocumentRetrieveParams

  RegulatoryDocumentUploadURLParams = Zavudev::Models::RegulatoryDocumentUploadURLParams

  Requirement = Zavudev::Models::Requirement

  RequirementAcceptanceCriteria = Zavudev::Models::RequirementAcceptanceCriteria

  RequirementFieldType = Zavudev::Models::RequirementFieldType

  RequirementType = Zavudev::Models::RequirementType

  Sender = Zavudev::Models::Sender

  SenderCreateParams = Zavudev::Models::SenderCreateParams

  SenderDeleteParams = Zavudev::Models::SenderDeleteParams

  SenderGetProfileParams = Zavudev::Models::SenderGetProfileParams

  SenderListParams = Zavudev::Models::SenderListParams

  SenderRegenerateWebhookSecretParams = Zavudev::Models::SenderRegenerateWebhookSecretParams

  SenderRetrieveParams = Zavudev::Models::SenderRetrieveParams

  Senders = Zavudev::Models::Senders

  SenderUpdateParams = Zavudev::Models::SenderUpdateParams

  SenderUpdateProfileParams = Zavudev::Models::SenderUpdateProfileParams

  SenderUploadProfilePictureParams = Zavudev::Models::SenderUploadProfilePictureParams

  SenderWebhook = Zavudev::Models::SenderWebhook

  Template = Zavudev::Models::Template

  TemplateCreateParams = Zavudev::Models::TemplateCreateParams

  TemplateDeleteParams = Zavudev::Models::TemplateDeleteParams

  TemplateListParams = Zavudev::Models::TemplateListParams

  TemplateRetrieveParams = Zavudev::Models::TemplateRetrieveParams

  TemplateSubmitParams = Zavudev::Models::TemplateSubmitParams

  WebhookEvent = Zavudev::Models::WebhookEvent

  WebhookSecretResponse = Zavudev::Models::WebhookSecretResponse

  WhatsappBusinessProfile = Zavudev::Models::WhatsappBusinessProfile

  WhatsappBusinessProfileResponse = Zavudev::Models::WhatsappBusinessProfileResponse

  WhatsappBusinessProfileVertical = Zavudev::Models::WhatsappBusinessProfileVertical

  WhatsappCategory = Zavudev::Models::WhatsappCategory
end
