FactoryGirl.define do
  factory :url do
    sequence(:url) { |n| "http://www.google.com/#{1}" }
  end
end
