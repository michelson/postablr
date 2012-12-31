# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :video, :class => 'Postablr::Entry::Video' do
    url "http://vimeo.com/55769583"
    #title "MyString"
    #product_id 1
    #thumbnail "MyString"
    #embed_url ""
    #embed_html "MyText"
    #flv "MyString"
    #download_url "MyString"
    #service "MyString"
    #duration 1
  end

  factory :youtube_video, :parent => :video do
    url "https://www.youtube.com/watch?v=5aFRBbnF-ag"
  end

end
