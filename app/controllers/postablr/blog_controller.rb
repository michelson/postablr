# -*- encoding : utf-8 -*-
require_dependency "postablr/application_controller"

module Postablr
  class BlogController < ApplicationController

    respond_to :html ,:rss

    def show
      @entries = Postablr::Entry.includes(:postable).published.order("postablr_entries.postable_type desc").page(params[:page]).per(6)
      respond_to do |format|
        format.rss { render :layout => false }
        format.html
      end
    end

    def filter
      @entries = Postablr::Entry.includes(:postable).published.where("postablr_entries.postable_type =?", "Postable::Entry::#{params[:filter].capitalize}").order("postablr_entries.created_at desc").page(params[:page]).per(6)
      render :show
    end

    def tags_get
      @q = params[:tag]
      @tags = ActsAsTaggableOn::Tag.where{( name =~ "#{@q}%")}
      render :json=> @tags.collect{ |tag| {"caption"=> tag.name, "value"=>tag.id.to_s } }
    end
  end
end
