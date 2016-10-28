FactoryGirl.define do
  factory :competitor do
    name "John"
  end

  factory :match do
    start_time { rand(1..100).days.from_now }

    location "Basketball Court"
    season 1
    association :competitor1, factory: :competitor, strategy: :create
    association :competitor2, factory: :competitor, strategy: :create

    factory :completed_match do
      winner { competitor1 }
      loser { competitor2 }
      start_time 1.days.ago
    end

    factory :future_match do
       start_time 5.days.from_now
    end
  end
end
