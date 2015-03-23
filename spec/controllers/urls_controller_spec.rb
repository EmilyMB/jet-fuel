require "rails_helper"

describe UrlsController do
  render_views

  describe "GET index" do
    it "assigns @urls" do
      url = create(:url)
      get :index

      expect(assigns(:urls)).to eq([url])
    end

    it "assigns @url" do
      get :index

      expect(assigns(:url).class).to eq(Url)
    end
  end
end
