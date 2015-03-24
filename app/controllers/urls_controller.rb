class UrlsController < ApplicationController
  def index
    @urls = Url.order(click_count: :desc)
  end

  def create
    @url = Url.find_or_create_by(url: params[:url])
    flash[:message] = "Your new url is: #{@url.short_url}"

    redirect_to root_path
  end

  def show
    @url = Url.find(params[:id])
    @url.increment!(:click_count)

    redirect_to @url.url
  end
end
