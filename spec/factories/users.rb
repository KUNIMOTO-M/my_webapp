FactoryBot.define do
  factory :user do
    sequence(:name) {  "テスト"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    password {314159}
  end
end