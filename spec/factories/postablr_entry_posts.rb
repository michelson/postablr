# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postablr_entry_post, :class => 'Entry::Post' do
    body ""
    title "MyString"
    body "MyText"
  end
end
