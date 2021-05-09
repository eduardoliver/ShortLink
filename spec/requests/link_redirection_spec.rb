require 'rails_helper'

RSpec.describe "Link redirection", type: :request do

  it "redirects to original URL for a given short link" do

    url = "https://www.wired.co.uk/article/social-media-future-sharing?utm_source=pocket-newtab-global-en-GB"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link

    get link.shortened_url


  end

end
