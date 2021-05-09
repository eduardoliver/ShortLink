class Link < ApplicationRecord

  validates_presence_of :lookup_code, :original_url

  validates_uniqueness_of :lookup_code

  validate :original_url_format

  def original_url_format
    begin
      if URI.parse(original_url).host.nil?
        errors.add(:original_url, "Invalid URI format")
      end
    rescue URI::InvalidURIError => e
    end
  end

  def shortened_url
    "http://localhost:3000/#{lookup_code}"
  end

end
