FactoryBot.define do
  factory :task do
    name { "MyString" }
    prioritize { false }
    done { false }
    deadline { "2018-12-16 01:01:23" }
    project { nil }
  end
end
