class Link < ApplicationRecord

  validates :url, :code, presence: true

  before_validation :format_url, :generate_code, on: :create

  def short_url(host)
    "#{host}/#{self.code}"
  end

  private

  def format_url
    self.url = 'https://' + url if url =~ /^www/
  end

  def generate_code
    self.code = Digest::MD5.base64digest(self.url).gsub("/\W/", "")[0..5] + SecureRandom.uuid[0..6]
  end

end
