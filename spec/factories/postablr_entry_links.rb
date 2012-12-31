# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postablr_entry_link, :class => 'Entry::Link' do
    title "MyString"
    url "MyString"
  end
end
