FactoryBot.define do
  factory :umail do
    sequence(:name) { |n| "TEST_NAME#{n}" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { 314_159 }
  end
end
