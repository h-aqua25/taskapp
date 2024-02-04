# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :user, factory: :user, strategy: :build

    sequence(:name) { |i| "タスク名_#{i}" }
    end_date { Time.current }
    priority { %w[low normal high].sample }
    status { 'untouched' }
    sequence(:explanation) { |i| "タスク説明文_#{i}" }
  end
end
