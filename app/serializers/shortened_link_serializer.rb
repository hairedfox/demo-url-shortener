class ShortenedLinkSerializer
  include JSONAPI::Serializer

  set_type :short_link
  set_id :uid
  attribute :url

  attribute :shortened_url
end
