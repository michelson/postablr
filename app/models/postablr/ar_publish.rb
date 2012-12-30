# -*- encoding : utf-8 -*-
# extracted from https://github.com/ismasan/ar_publish_control
module Postablr
  module ArPublish

    extend ActiveSupport::Concern

    included do
      #extend ClassMethods
      @statuses = [:published, :draft, :upcoming, :expired]

      after_initialize :fill_default_publish
    end

    module ClassMethods
      # == Configuration options
      #
      # Right now this plugin has only one configuration option. Models with no publication dates
      # are by default published, not unpublished. If you want to hide your model when it has no
      # explicit publication date set, you can turn off this behaviour with the
      # +publish_by_default+ (defaults to <tt>true</tt>) option like so:
      #
      # class Post < ActiveRecord::Base
      # publish_control :publish_by_default => false
      # end
      #
      # == Database Schema
      #
      # The model that you're publishing needs to have two special date attributes:
      #
      # * publish_at
      # * unpublish_at
      #
      # These attributes have no further requirements or required validations; they
      # just need to be <tt>datetime</tt>-columns.
      #
      # You can use a migration like this to add these columns to your model:
      #
      # class AddPublicationDatesToPosts < ActiveRecord::Migration
      # def self.up
      # add_column :posts, :publish_at, :datetime
      # add_column :posts, :unpublish_at, :datetime
      # end
      #
      # def self.down
      # remove_column :posts, :publish_at
      # remove_column :posts, :unpublish_at
      # end
      # end
      #
      def publish_control(options = { :publish_by_default => true })
        # don't allow multiple calls
        #return if self.included_modules.include?(ArPublishControl::Publishable::InstanceMethods)
        #send :include, ArPublishControl::Publishable::InstanceMethods

        scope :published, lambda{{:conditions => published_conditions}}
        scope :unpublished, lambda{{:conditions => unpublished_conditions}}
        scope :upcoming, lambda{{:conditions => upcoming_conditions}}
        scope :expired, lambda {{:conditions => expired_conditions}}
        scope :draft, :conditions => {:is_published => false}

        scope :published_only, lambda {|*args|
          bool = (args.first.nil? ? true : (args.first)) # nil = true by default
          bool ? {:conditions => published_conditions} : {}
        }

        validate :validate_publish_date_consistency
        before_create :publish_by_default if options[:publish_by_default]
      end

      # Takes a block whose containing SQL queries are limited to
      # published objects. You can pass a boolean flag indicating
      # whether this scope should be applied or not--for example,
      # you might want to disable it when the user is an administrator.
      # By default the scope is applied.
      #
      # Example usage:
      #
      # Post.published_only(!logged_in?)
      # @post.comments.published_only(!logged_in?)
      #

      protected

      # returns a string for use in SQL to filter the query to unpublished results only
      # Meant for internal use only
      def unpublished_conditions
        t = Time.now
        ["(#{table_name}.is_published = ? OR #{table_name}.publish_at > ?) OR (#{table_name}.unpublish_at IS NOT NULL AND #{table_name}.unpublish_at < ?)",false,t,t]
      end

      # return a string for use in SQL to filter the query to published results only
      # Meant for internal use only
      def published_conditions
        t = Time.now
        ["(#{table_name}.is_published = ? AND #{table_name}.publish_at <= ?) AND (#{table_name}.unpublish_at IS NULL OR #{table_name}.unpublish_at > ?)",true,t,t]
      end

      def upcoming_conditions
        t = Time.now
        ["(#{table_name}.is_published = ? AND #{table_name}.publish_at > ?)",true,t]
      end

      def expired_conditions
        t = Time.now
        ["(#{table_name}.unpublish_at IS NOT NULL AND #{table_name}.unpublish_at < ?)",t]
      end
    end


    def fill_default_publish
      self.publish_at = Time.now if self.publish_at.nil?
    end

    # ActiveRecrod callback fired on +before_create+ to make
    # sure a new object always gets a publication date; if
    # none is supplied it defaults to the creation date.
    def publish_by_default
      self.is_published = true if is_published.nil?
    end

    # Validate that unpublish_at is greater than publish_at
    # publish_at must not be nil
    def validate_publish_date_consistency
      if unpublish_at && publish_at && unpublish_at <= publish_at
        errors.add(:unpublish_at,"should be greater than publication date or empty")
      end
    end

    # Return whether the current object is published or not
    def published?
      (is_published? && (publish_at <=> Time.now) <= 0) && (unpublish_at.nil? || (unpublish_at <=> Time.now) >= 0)
    end

    def upcoming?
      (is_published? && publish_at > Time.now)
    end

    def expired?
      (!unpublish_at.nil? && unpublish_at < Time.now)
    end

    # Indefinitely publish the current object right now
    def publish
      return if published?
      self.is_published = true
      self.publish_at = Time.now
      self.unpublish_at = nil
    end

    # Same as publish, but immediatly saves the object.
    # Raises an error when saving fails.
    def publish!
      publish
      save!
    end

    # Immediatly unpublish the current object
    def unpublish
      return unless published?
      self.is_published = false
    end

    # Same as unpublish, but immediatly saves the object.
    # Raises an error when saving files.
    def unpublish!
      unpublish
      save!
    end

  end
end
