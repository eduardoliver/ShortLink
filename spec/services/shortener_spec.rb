require "rails_helper"

RSpec.describe Shortener do

  it "shortens a given URL to a 7 character lookup code" do
    url = "https://www.favouritewebsite.com/articles/how-to-cook"
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end

  it "it gives each URL its own lookup code" do
    url = "https://www.favouritewebsite.com/articles/how-to-cook"
    shortener = Shortener.new(url)
    code_1 = shortener.lookup_code

    url = "https://www.favouritewebsite.com/articles/how-to-clean"
    shortener = Shortener.new(url)
    code_2 = shortener.lookup_code

    expect(code_2).not_to eq(code_1)
  end

  it "always give the same url the same lookup code" do
    url = "https://www.favouritewebsite.com/articles/how-to-cook"

    shortener = Shortener.new(url)
    code_a = shortener.lookup_code

    shortener = Shortener.new(url)
    code_b = shortener.lookup_code

    expect(code_a).to eq(code_b)
  end

  it "generates a unique record with a unique lookup code" do
    url = "https://www.favouritewebsite.com/articles/how-to-cook"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
    expect(link.valid?).to be(true)

  end

end
