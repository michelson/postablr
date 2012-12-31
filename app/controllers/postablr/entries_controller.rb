# -*- encoding : utf-8 -*-
require_dependency "postablr/application_controller"

module Postablr
  class EntriesController < ApplicationController

    before_filter :authenticate_user!

    inherit_resources

    respond_to :js

    def new
      @entry = current_user.entries.new
      @entry.postable = "Postablr::Entry::#{params[:type].capitalize}".constantize.send(:new)
    end

    def create
      @entry = current_user.entries.new(params[:entry].except("postable_attributes"))
      #@entry.tag_list = ActsAsTaggableOn::Tag.find(params[:tag_list_input]).map(&:name) unless params[:tag_list_input].blank?
      @entry.postable = "Postablr::Entry::#{params[:type].capitalize}".constantize.new(params[:entry][:postable_attributes])
      create!{
        if @entry.errors.blank?
          entry_url(@entry)
        end
      }
    end

    def update
      @entry = current_user.entries.find(params[:post_id])
      #@entry.tag_list = ActsAsTaggableOn::Tag.find(params[:tag_list_input]).map(&:name) unless params[:tag_list_input].blank?
      update!{ entry_url(@entry) if @entry.errors.blank? }
    end

    def destroy
      destroy!{entries_url}
    end

protected
    def begin_of_association_chain
      current_user
    end

    def collection
      @entries ||= end_of_association_chain.order("created_at desc").page(params[:page]).per(6)
    end
  end
end
