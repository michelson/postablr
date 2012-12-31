# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Postablr::Entry::Video do

  it{should have_one :entry}

  describe "creation" do
    it "should have video attributes youtube" do
      @video = FactoryGirl.create(:video)
      @video.thumbnail.should_not be_blank
      @video.embed_url.should_not be_blank
      @video.embed_html.should_not be_blank
      @video.title.should_not be_blank
      @video.title.should == "Pezet x Jimek \"Nie musze wracac\""
      @video.duration.should_not be_blank
      @video.thumbnail.should_not be_blank
    end
    it "should have video attributes youtube" do
      @video = FactoryGirl.create(:youtube_video)
      @video.thumbnail.should_not be_blank
      @video.embed_url.should_not be_blank
      @video.embed_html.should_not be_blank
      @video.title.should_not be_blank
      @video.title.should == "Frank Zappa_ A day with Frank Zappa_1971"
      @video.duration.should_not be_blank
      @video.thumbnail.should_not be_blank
    end
  end
end
