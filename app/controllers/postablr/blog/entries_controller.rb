require_dependency "postablr/application_controller"

module Postablr
  class Blog::EntriesController < ApplicationController

    def show
      @entry = Postablr::Entry.find(params[:id])
      @relateds = Postablr::Entry.tagged_with(@entry.tags.map(&:name)) #, :match_all => true).where("postablr_entries.id != ?", params[:id])
    end

  end
end
