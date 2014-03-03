FactoryGirl.define do
  factory :run do
    title { Faker::Lorem.sentence(word_count = 3) }
    association :venue
    association :company

    factory :recent_week_run do
      after(:create) do |run|
        create(:recent_week_performance, run: run)
      end

      ignore do
        performances_count 2
      end

      after(:create) do |run, evaluator|
        create_list(:recent_week_performance, evaluator.performances_count, run: run)
      end
    end

    factory :upcoming_week_run do
      after(:create) do |run|
        create(:upcoming_week_performance, run: run)
      end

      ignore do
        performances_count 2
      end

      after(:create) do |run, evaluator|
        create_list(:upcoming_week_performance, evaluator.performances_count, run: run)
      end
    end

    factory :recent_month_run do
      after(:create) do |run|
        create(:recent_month_performance, run: run)
      end

      ignore do
        performances_count 2
      end

      after(:create) do |run, evaluator|
        create_list(:recent_month_performance, evaluator.performances_count, run: run)
      end
    end

    factory :upcoming_month_run do
      after(:create) do |run|
        create(:upcoming_month_performance, run: run)
      end

      ignore do
        performances_count 2
      end

      after(:create) do |run, evaluator|
        create_list(:upcoming_month_performance, evaluator.performances_count, run: run)
      end
    end
  end
end