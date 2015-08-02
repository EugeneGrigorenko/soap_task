FactoryGirl.define do
  factory :country do
    code { Faker::Address.country_code }
    name { Faker::Address.country }
  end
end
