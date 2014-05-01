FactoryGirl.define do
  factory :performance do
    date Time.now - 86400
    time "2000-01-01 19:30:00 UTC"
    pretty_time "7:30 PM"
    association :run
  
    # Performance within the last week
    factory :recent_week_performance do
      sequence :date do |n|
        Time.now - n*60*60*24
      end
      sequence :pretty_date do |n|
        (Time.now - n*60*60*24).to_date.strftime("%A, %B %e, %Y")
      end
    end

    # Performance in the upcoming week
    factory :upcoming_week_performance do
      sequence :date do |n|
        Time.now + n*60*60*24
      end
      sequence :pretty_date do |n|
        (Time.now + n*60*60*24).to_date.strftime("%A, %B %e, %Y")
      end
    end
    
    # Performance within the last month but not the last week
    factory :recent_month_performance do
      sequence :date do |n|
        Time.now - (n*60*60*24 + 60*60*24*7*6)
      end
      sequence :pretty_date do |n|
        (Time.now - (n*60*60*24 + 60*60*24*7*6)).to_date.strftime("%A, %B %e, %Y")
      end
    end

    # Performance in the upcoming month but not upcoming week
    factory :upcoming_month_performance do
      sequence :date do |n|
        Time.now + (n*60*60*24 + 60*60*24*7*6)
      end
      sequence :pretty_date do |n|
        (Time.now + (n*60*60*24 + 60*60*24*7*6)).to_date.strftime("%A, %B %e, %Y")
      end
    end

  end
end
