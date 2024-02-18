FactoryBot.define do
  factory :slot do
    start_time { Time.now }
    end_time { Time.now + 2.hours }
  end
end
