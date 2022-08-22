# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "名前_#{n}" }
    sequence(:email) { |n| "Eメール#{n}@gmail.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:password_confirmation) { |n| "password#{n}" }
  end
end
