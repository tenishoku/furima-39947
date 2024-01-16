FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    japanese_user = Gimei.name
    first_name            { japanese_user.first.kanji }
    first_name_kana       { japanese_user.first.katakana }
    last_name             { japanese_user.last.hiragana }
    last_name_kana        { japanese_user.last.katakana }
    birth_date            { Faker::Date.birthday(min_age: 4, max_age: 94) }
  end
end
