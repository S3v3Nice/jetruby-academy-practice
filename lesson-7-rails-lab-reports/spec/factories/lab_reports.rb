FactoryBot.define do
  factory :lab_report do
    title       { "Lab Report Title" }
    description { "Lab report description" }
    grade       { %w[A B C D E FX F].sample }
    user
  end
end
