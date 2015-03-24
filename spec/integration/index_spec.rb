require "rails_helper"

describe "a guest user", type: :feature do
  it "can visit the root path" do
    visit root_path

    expect(current_path).to eq(root_path)
  end

  it "can input a long URL" do
    visit root_path

    fill_in("url", with: "http://www.example.com")
    click_link_or_button("Shorten it!")
    url = Url.last

    expect(url.short_url.length).to eq(27)
    expect(page).to have_content(url.short_url)
    expect(current_path).to eq(url_path(url))
  end

  it "can see all the links with added date" do
    5.times { create(:url) }

    visit root_path

    expect(page).to have_css(".link", count: 5)
    expect(page).to have_content(Url.first.created_at.strftime("%d-%m-%Y"))
  end

  it "can see the links sorted by popularity" do
    url1 = create(:url, click_count: 5)
    url2 = create(:url, click_count: 50)
    url3 = create(:url, click_count: 0)

    expect(first(:link)[:href]).to eq(url2.url)
  end
end
