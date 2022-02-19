class ShortenedLink < ApplicationRecord
  URL_FORMAT = /\Ahttp(s)?:\/\/(www\.)?.+\z/.freeze

  before_save :init_uid

  validates :uid, presence: true, length: { is: 6 }
  validates :url, presence: true, format: URL_FORMAT

  def shortened_url
    options = Rails.application.routes.default_url_options

    url = options[:port].present? ? options[:host] : "#{options[:host]}:#{options[:port]}"

    "#{url}/#{uid}"
  end

  private

  def init_uid
    new_uid = generate_new_uid

    while self.class.exists?(new_uid)
      new_uid = generate_new_uid
    end

    self.uid = new_uid
  end

  def generate_new_uid
    SecureRandom.hex(3)
  end
end
