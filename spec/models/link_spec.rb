require 'rails_helper'

RSpec.describe Link, type: :model do

  it "it is valid if has an original URL and lookup code" do
    link = Link.new(
      original_url: "https://www.favouritewebsite.com/articles/how-to-cook",
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(true)
  end

  it "it is invalid if it does not have a lookup code" do
    link = Link.new(
      original_url: "https://www.favouritewebsite.com/articles/how-to-cook",
    )
    expect(link.valid?).to be(false)
  end

  it "it is invalid if it does not have an original url" do
    link = Link.new(
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
  end

end
