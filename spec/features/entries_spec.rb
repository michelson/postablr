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
end