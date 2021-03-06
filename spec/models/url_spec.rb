require "rails_helper"

RSpec.describe Url, type: :model do
  it "has a short url" do
    url = create(:url)

    expect(url).to be_valid
    expect(url.short_url.length).to eq(27)
  end

  it "has a formatted created at date" do
    url = create(:url)

    expect(url.formatted_date).to eq(url.created_at.strftime("%d-%m-%Y"))
  end
end
