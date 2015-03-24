class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def create
    @url = Url.create(url: params[:url], short_url: short_url)

    redirect_to url_path(@url)
  end

  def show
    @url = Url.find(params[:id])
  end

  private

  def short_url
    ShortUrl.call
  end
end
