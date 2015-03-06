FactoryGirl.define do
  factory :sentence do
    sequence(:body) {|n| "#{Faker::Company.bs}-#{n} + *"}
  end

end
