FactoryBot.define do
  factory :doctor do
    name {Faker::Name.first_name}
    sequence(:years_practiced)  { |n| n }
    university {Faker::Coffee.variety}
  end
end
