class ShortUrl
  def self.call
    new_url = "http://localhost:3000/"
    5.times { new_url += ("A".."Z").to_a.sample }
    new_url
  end
end
