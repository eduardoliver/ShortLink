require "rails_helper"

RSpec.describe Shortener do

  it "shortens a given URL to a 7 character lookup code" do
    url = "https://www.favouritewebsite.com/articles/how-to-cook"
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end

end
