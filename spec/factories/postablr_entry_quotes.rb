# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postablr_entry_quote, :class => 'Entry::Quote' do
    body "MyText"
    source "MyString"
  end
end
