# -*- encoding : utf-8 -*-
module Postablr
  class Entry < ActiveRecord::Base
    attr_accessible :comments_enabled, :content_source, :highlight,
    :is_published, :postable_id, :postable_type, :publish_at, :slug,
    :unpublish_at, :user_id, :postable_attributes, :tag_list,
    :publish_state

    belongs_to :user
    belongs_to :postable, :polymorphic => true , :dependent=>:destroy , :touch => true

    #has_many :comments,  :as=>:commentable , :class_name=>Forum::Comment

    #default_scope includes(:postable)

    accepts_nested_attributes_for :postable, :reject_if => :all_blank, :allow_destroy => true

    after_initialize :defaults

    acts_as_taggable

    include Postablr::ArPublish
    publish_control :publish_by_default => false

    def categories_list
      categories.map(&:name).join(", ")
    end

    def defaults
      return unless new_record?
      self.comments_enabled = true
      self.is_published = true
    end


    def postable_name
      postable.class.table_name.split("_")[2].singularize
    end


  end
end
