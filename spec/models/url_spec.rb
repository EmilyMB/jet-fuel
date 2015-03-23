require "rails_helper"

RSpec.describe Url, type: :model do
  it "has a url and a short url" do
    url = create(:url)

    expect(url).to be_valid
    expect(url.url).to eq("http://www.google.com")
    expect(url.short_url).to eq("http://SERVER/AFGAD")
  end
end
