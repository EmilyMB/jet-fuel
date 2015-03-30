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
    expect(page).to have_content(url.url)
    expect(current_path).to eq(root_path)
  end

  it "can see all the links with added date" do
    5.times { create(:url) }

    visit root_path

    expect(page).to have_css(".link", count: 5)
    expect(page).to have_content(Url.first.created_at.strftime("%d-%m-%Y"))
  end

  it "can see the links sorted by popularity" do
    create(:url, click_count: 5)
    create(:url, click_count: 50)
    popular_url = create(:url, click_count: 1000)
    create(:url, click_count: 100)

    visit root_path

    within("#urls") do
      expect(first(:link)[:href]).to eq(url_path(popular_url))
    end
  end

  it "can increase in popularity by clicking the link" do
    url = create(:url, url: "http://www.google.com")

    visit root_path
    3.times { click_link_or_button("#{url.short_url}") }

    expect(Url.find(url.id).click_count).to eq(3)
  end

  it "can sort by date" do
    create(:url, click_count: 50)
    popular_url = create(:url, click_count: 1000)
    popular_url.update_attributes(created_at: Date.new(1990, 1, 1))

    visit root_path
    click_link_or_button("Date added")

    expect(first(:link)[:href]).not_to eq(url_path(popular_url))
  end
end
