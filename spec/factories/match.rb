# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
  end

  factory :match_started, :class => 'Match' do
    started_at 2.hours.ago
  end

  factory :match_ended, :class => 'Match' do
    started_at 2.hours.ago
    ended_at   1.hour.ago
  end
end
