require_dependency "postablr/application_controller"

module Postablr
  class BlogController < ApplicationController

    def show
      @entries = Postablr::Entry.includes(:postable).published.order("postablr_entries.postable_type.created_at desc").page(params[:page]).per(6)
    end

    def filter
      @entries = Postablr::Entry.includes(:postable).published.where("postablr_entries.postable_type =?", "Entry::#{params[:filter].capitalize}").order("postablr_entries.created_at desc").page(params[:page]).per(6)
      render :show
    end

    def tags_get
      @q = params[:tag]
      @tags = ActsAsTaggableOn::Tag.where{( name =~ "#{@q}%")}
      render :json=> @tags.collect{ |tag| {"caption"=> tag.name, "value"=>tag.id.to_s } }
    end
  end
end
