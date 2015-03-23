require "rails_helper"

describe "a guest user", type: :feature do

  it "can visit the root path" do
    visit root_path

    expect(current_path).to eq(root_path)
  end

  it "can input a long URL" do
    visit root_path

    fill_in("url", with: "http://www.example.com")
    url = Url.last
    
    expect(url.short_url.length).to eq(19)
    expect(page).to have_content(url.short_url)
  end
end
