# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Postablr::BlogController do

  describe "routing" do
    it "routes to #show" do
      expect(:get => "/blog").to route_to(:controller => "postablr/blog", :action => "show")
      #get("/blog").should route_to("postablr/blog#show")
    end
  end

end
