require 'spec_helper'

require 'support/request_helpers'
include RequestHelpers

describe "entries" do
  #let(:authed_user) { create_logged_in_user }
  before :each do
    create_logged_in_user
  end

  it "should allow access" do
    visit "/entries"
    # should be good!
    page.status_code.should == 200
    page.should have_content("Blog")
    page.should have_content("Publish Text")
    page.should have_css(".text")
  end

  it "should publish post" do
    visit "/entries/new/post"
    page.status_code.should == 200
    page.find_field("entry_postable_attributes_title").should be_true
    page.find_field("entry_postable_attributes_body").should be_true

    fill_in 'entry_postable_attributes_title', :with => 'Zappa picks by Larry La Londe'
    fill_in 'entry_postable_attributes_body', :with => 'This is one of the best albums'
    find_button("Create Entry").click

    page.current_url.should match(Regexp.new("/entries"))
    Postablr::Entry.all.size.should == 1
  end

  it "should publish Quote" do
    visit "/entries/new/quote"
    page.status_code.should == 200
    page.find_field("entry_postable_attributes_body").should be_true
    page.find_field("entry_postable_attributes_source").should be_true

    fill_in 'entry_postable_attributes_body', :with => 'Zappa picks by Larry La Londe'
    fill_in 'entry_postable_attributes_source', :with => 'This is one of the best albums'
    find_button("Create Entry").click

    page.current_url.should match(Regexp.new("/entries"))
    Postablr::Entry.all.size.should == 1
  end

  it "should publish Image" do
    visit "/entries/new/image"
    page.status_code.should == 200
    page.find_field("entry_postable_attributes_photo").should be_true
    page.find_field("entry_postable_attributes_body").should be_true

    fill_in 'entry_postable_attributes_body', :with => 'Zappa picks by Larry La Londe'
    attach_file('entry_postable_attributes_photo', "#{ENGINE_RAILS_ROOT}/spec/fixtures/Chungas_Revenge.jpg")
    find_button("Create Entry").click

    page.current_url.should match(Regexp.new("/entries"))
    Postablr::Entry.all.size.should == 1
  end

  it "should publish Audio" do
    visit "/entries/new/audio"
    page.status_code.should == 200
    page.find_field("entry_postable_attributes_file").should be_true
    page.find_field("entry_postable_attributes_title").should be_true
    page.find_field("entry_postable_attributes_body").should be_true

    fill_in 'entry_postable_attributes_body', :with => 'Zappa picks by Larry La Londe'
    fill_in 'entry_postable_attributes_title', :with => 'Zappa picks by Larry La Londe'
    attach_file('entry_postable_attributes_file', "#{ENGINE_RAILS_ROOT}/spec/fixtures/440hz.mp3")
    find_button("Create Entry").click

    page.current_url.should match(Regexp.new("/entries"))
    Postablr::Entry.all.size.should == 1
  end

  it "should publish video" do
    visit "/entries/new/video"
    page.status_code.should == 200
    page.find_field("entry_postable_attributes_url").should be_true
    page.find_field("entry_postable_attributes_title").should be_true

    fill_in 'entry_postable_attributes_url', :with => 'http://www.youtube.com/watch?v=c6-rgXAEwAY'
    fill_in 'entry_postable_attributes_title', :with => 'Zappa picks by Larry La Londe'
    find_button("Create Entry").click

    page.current_url.should match(Regexp.new("/entries"))
    Postablr::Entry.all.size.should == 1
  end

  it "should publish link" do
    visit "/entries/new/link"
    page.status_code.should == 200
    page.find_field("entry_postable_attributes_url").should be_true
    page.find_field("entry_postable_attributes_title").should be_true

    fill_in 'entry_postable_attributes_url', :with => 'http://www.youtube.com/watch?v=c6-rgXAEwAY'
    fill_in 'entry_postable_attributes_title', :with => 'Zappa picks by Larry La Londe'
    find_button("Create Entry").click

    page.current_url.should match(Regexp.new("/entries"))
    Postablr::Entry.all.size.should == 1
  end

end