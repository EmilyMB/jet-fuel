class Url < ActiveRecord::Base
  before_create :add_short_url

  def formatted_date
    created_at.strftime("%d-%m-%Y")
  end

  private

  def add_short_url
    self.short_url = ShortUrl.call
  end
end
