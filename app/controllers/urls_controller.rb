class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def create
    @url = Url.create(url: params[:url], short_url: "http://SERVER/AFGAD")

    redirect_to url_path(@url)
  end

  def show
    @url = Url.find(params[:id])
  end
end
