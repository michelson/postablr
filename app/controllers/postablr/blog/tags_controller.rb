# -*- encoding : utf-8 -*-
require_dependency "postablr/application_controller"

module Postablr
  class Blog::TagsController < ApplicationController
    def show
      @entries = Postablr::Entry.includes(:postable).joins(:user).published.tagged_with(params[:id]).page(params[:page]).per(6)
      # order("entries.created_at desc")
      render "postablr/blog/show"
    end
  end
end
