require "rails_helper"

describe "a guest user", type: :feature do
  it "can be redirected to the original URL" do
    visit root_path
    fill_in("url", with: "http://www.google.com")
    click_link_or_button("Shorten it!")
    url = Url.last

    visit url_path(url)
    
    expect(page).to have_content(url.short_url)
  end
end
