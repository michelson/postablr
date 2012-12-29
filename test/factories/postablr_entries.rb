# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postablr_entry, :class => 'Entry' do
    user_id 1
    postable_id 1
    postable_type "MyString"
    comments_enabled false
    highlight false
    slug "MyString"
    content_source "MyString"
    is_published false
    publish_at "2012-12-22 16:54:05"
    unpublish_at "2012-12-22 16:54:05"
  end
end
