FactoryGirl.define do

  factory :user do |u|
    #association :profile, factory: :profile, strategy: :build
    u.email "frank@zappa.com"
    #u.confirmed_at 1.hour.ago
    u.password '123456'
    #u.total_credits  0
  end

end