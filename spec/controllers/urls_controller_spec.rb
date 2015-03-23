require "rails_helper"

describe UrlsController do
  render_views

  describe "GET index" do
    it "assigns @urls" do
      url = create(:url)
      get :index

      expect(assigns(:urls)).to eq([url])
    end
  end

  describe "#creates" do
    it "creates a url with a short url" do
      post :create, url: "www.google.com"

      expect(Url.last.short_url.length).to eq(5)
    end
  end
end
