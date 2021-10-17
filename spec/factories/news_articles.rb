FactoryBot.define do
  factory :news_article do
    title { "MyString" }
    description { "MyText" }
    published_at { "2021-10-16 18:27:34" }
    view_count { 1 }
  end
end
