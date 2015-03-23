class UrlsController < ApplicationController
  def index
    @urls = Url.all
    @url = Url.new
  end
end
