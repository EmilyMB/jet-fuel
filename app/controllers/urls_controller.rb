class UrlsController < ApplicationController
  require "uri"
  helper_method :sort_column, :sort_direction

  def index
    if params[:sort]
      @urls = Url.order(sort_column + " " + sort_direction)
    else
      @urls = Url.order(click_count: :desc)
    end
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
    uri.is_a?(URI::HTTP)
  end

  def sort_column
    Url.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
