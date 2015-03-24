class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def create
    @url = Url.find_or_create_by(url: params[:url])

    redirect_to url_path(@url)
  end

  def show
    @url = Url.find(params[:id])
  end
end
