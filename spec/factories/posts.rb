FactoryBot.define do
  factory :post do
    association :user
    title{ Faker::Lorem.characters(number:10) }
    content{ Faker::Lorem.characters(number: 20) }
    map_id{ 1 }
    agent_id{ 1 }
    

  end
end
