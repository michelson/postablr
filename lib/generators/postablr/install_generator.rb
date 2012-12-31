# -*- encoding : utf-8 -*-

module Postablr
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Postablr initializer and copy locale files to your application."
      class_option :orm

      def copy_initializer
        template "postablr.rb", "config/initializers/postablr.rb"
      end

      def copy_locale
        #copy_file "../../../config/locales/en.yml", "config/locales/postablr.en.yml"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
