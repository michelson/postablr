# -*- encoding : utf-8 -*-
module Postablr
  module Generators
    # Include this module in your generator to generate Postablr views.
    # `copy_views` is the main method and by default copies all views
    # with forms.
    module ViewPathTemplates #:nodoc:
      extend ActiveSupport::Concern

      included do
        argument :scope, :required => false, :default => nil,
                         :desc => "The scope to copy views to"

        # Le sigh, ensure Thor won't handle opts as args
        # It should be fixed in future Rails releases
        class_option :form_builder, :aliases => "-b"

        public_task :copy_views
      end

      # TODO: Add this to Rails itslef
      module ClassMethods
        def hide!
          Rails::Generators.hide_namespace self.namespace
        end
      end

      def copy_views
        view_directory :blog
        view_directory :entries
      end

      protected

      def view_directory(name, _target_path = nil)
        directory name.to_s, _target_path || "#{target_path}/#{name}"
      end

      def target_path
        @target_path ||= "app/views/#{scope || :postablr}"
      end
    end

    class SharedViewsGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../../../app/views/postablr", __FILE__)
      desc "Copies shared Postablr views to your application."
      hide!

      # Override copy_views to just copy shared.
      def copy_views
        view_directory :shared
      end
    end

    class FormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../../../app/views/postablr", __FILE__)
      desc "Copies default Postablr views to your application."
      hide!
    end

    class SimpleFormForGenerator < Rails::Generators::Base #:nodoc:
      include ViewPathTemplates
      source_root File.expand_path("../../templates/simple_form_for", __FILE__)
      desc "Copies simple form enabled views to your application."
      hide!
    end

    class ViewsGenerator < Rails::Generators::Base
      desc "Copies Postablr views to your application."

      argument :scope, :required => false, :default => nil,
                       :desc => "The scope to copy views to"

      invoke SharedViewsGenerator

      hook_for :form_builder, :aliases => "-b",
                              :desc => "Form builder to be used",
                              :default => "form_for"
                              #:default => defined?(SimpleForm) ? "simple_form_for" : "form_for"

    end
  end
end
