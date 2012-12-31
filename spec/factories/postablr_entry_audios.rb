# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postablr_entry_audio, :class => 'Entry::Audio' do
    file "MyString"
    file_size "MyString"
    file_content_type "MyString"
  end
end
