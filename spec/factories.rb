FactoryGirl.define do
  factory :url do
    sequence(:url) { |n| "http://www.google.com/#{n}" }
  end
end
