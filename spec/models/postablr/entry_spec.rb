require 'spec_helper'

describe Postablr::Entry do
  it{should belong_to :user}
  it{should belong_to :postable}

  describe "Entry" do
    before(:each) do
      @user = Factory.create(:user)
      Postablr::Entry.destroy_all
      @published_post = @user.entries.create do |p|
        p.publish_at = 1.day.ago
        p.unpublish_at = 2.days.from_now
      end

      @unpublished_post = @user.entries.create do |p|
        p.publish_at = 1.day.from_now
        p.unpublish_at = 2.days.from_now
      end
    end

    it "should work with named scope at class level" do
      Postablr::Entry.published.size.should == 1
    end

    it "should work with named scope at collection level" do
      @user.entries.published.size.should == 1
    end

    it "should find unpublished with named scope" do
      Postablr::Entry.unpublished.size.should == 1
    end

    it "should find all with conditional flag" do
      Postablr::Entry.published_only.size.should == 1
      Postablr::Entry.published_only(true).size.should == 1
    end

    it "should validate that unpublish_at is greater than publish_at" do
      pending
    end

  end

  describe "Entry", "unpublished by default" do
    before(:each) do
      Postablr::Entry.destroy_all
      @user = Factory.create(:user)
      @a1 = @user.entries.create
      @invalid = @user.entries.create( :publish_at => '')
    end

    it "should be valid" do
      @a1.should be_valid
      @a1.publish_at.should_not be_nil
      @invalid.publish_at.should_not be_blank
    end

    it "should be published by default" do
      @a1.published?.should be_true
      Postablr::Entry.published.size.should == 2
    end

    it "should publish" do
      @a1.publish!
      @a1.published?.should be_true
    end
  end

  describe "Entry", 'upcoming' do
    before(:each) do
      Postablr::Entry.destroy_all
      @user = Factory.create(:user)
      @p1 = @user.entries.create(:is_published => true,:publish_at => 1.day.from_now) #upcoming
      @p2 = @user.entries.create(:is_published => true,:publish_at => 1.week.from_now)#upcoming
      @p3 = @user.entries.create(:is_published => false,:publish_at => 1.day.from_now)#unpublished
      @p4 = @user.entries.create(:is_published => true)#published
    end

    it "should have upcoming" do
      @p1.upcoming?.should be_true
      @p2.upcoming?.should be_true
      @p3.upcoming?.should be_false
      @p4.upcoming?.should be_false
      Postablr::Entry.upcoming.size.should == 2
    end
  end

  describe "Entry", 'expired' do
    before(:each) do
      @user = Factory.create(:user)
      Postablr::Entry.destroy_all
      @p1 = @user.entries.create(:is_published => true,:publish_at => 2.weeks.ago) #published
      @p2 = @user.entries.create(:is_published => true,:publish_at => 2.weeks.ago,:unpublish_at => 1.day.ago)#expired
      @p3 = @user.entries.create(:is_published => false,:publish_at => 3.days.ago,:unpublish_at => 2.hours.ago)#unpublished and expired
    end

    it "should have expired" do
      @p1.expired?.should be_false
      @p2.expired?.should be_true
      @p3.expired?.should be_true
      Postablr::Entry.expired.size.should == 2
    end
  end

  describe "Entry", 'draft' do
    before(:each) do
      Postablr::Entry.destroy_all
      @user = Factory.create(:user)
      @p1 = @user.entries.create(:is_published => true, :publish_at => 2.weeks.ago) #published
      @p2 = @user.entries.create(:is_published => true, :publish_at => 2.weeks.ago,:unpublish_at => 1.day.ago) #expired
      @p3 = @user.entries.create(:is_published => false, :publish_at => 3.days.ago,:unpublish_at => 2.hours.ago) #unpublished and expired
    end

    it "should have draft" do
      @p1.should be_published
      @p2.should be_published
      @p3.should be_draft
      #Postablr::Entry.draft.count.should == 1
      #Postablr::Entry.draft.first.should == @p3
    end
  end

  describe "new record" do
    it "should default to Time.now" do
      # d = Time.now
      # Time.stub!(:now).and_return d
      a = Postablr::Entry.new
      a.publish_at.should_not be_nil
    end
  end


end
