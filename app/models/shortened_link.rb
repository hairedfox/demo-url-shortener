class ShortenedLink < ApplicationRecord
  URL_FORMAT = /\Ahttp(s)?:\/\/(www\.)?.+\z/.freeze

  before_save :init_uid

  validates :url, presence: true, format: URL_FORMAT

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
