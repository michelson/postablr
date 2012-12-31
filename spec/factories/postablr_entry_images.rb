# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postablr_entry_image, :class => 'Entry::Image' do
    photo "MyString"
    body "MyText"
    photo_content_type "MyString"
    photo_size "MyString"
  end
end
