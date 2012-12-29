# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postablr_entry_video, :class => 'Entry::Video' do
    title "MyString"
    thumbnail "MyString"
    embed_url "MyString"
    embed_html "MyText"
    flv "MyString"
    download_url "MyString"
    service "MyString"
    duration 1
  end
end
