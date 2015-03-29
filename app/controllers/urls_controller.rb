class UrlsController < ApplicationController
  require "uri"

  def index
    @urls = Url.order(click_count: :desc)
  end

  def create
    if url_valid?
      @url = Url.find_or_create_by(url: params[:url])
      flash[:message] = "Your short url is: #{@url.short_url}"
    else
      flash[:error] = "Please enter a valid url(including http:// or https://)"
    end
    redirect_to root_path
  end

  def show
    @url = Url.find(params[:id])
    @url.increment!(:click_count)

    redirect_to @url.url
  end

  private

  def url_valid?
    uri = URI.parse(params[:url])
    uri.kind_of?(URI::HTTP)
  end
end
